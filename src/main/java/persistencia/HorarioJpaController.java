package persistencia;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import logica.Horario;

public class HorarioJpaController implements Serializable {

    private static final long serialVersionUID = 1L;

    public HorarioJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public HorarioJpaController() {
        emf = Persistence.createEntityManagerFactory("ClinicaOdontologica");
    }
    
    
    /* CREATE */
    public void create(Horario horario) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(horario);
            em.getTransaction().commit();
        } finally {
            if (em != null) em.close();
        }
    }

    /* EDIT */
    public void edit(Horario horario) throws Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            horario = em.merge(horario);
            em.getTransaction().commit();
        } catch (Exception ex) {
            int id = horario.getId_horario();
            if (findHorario(id) == null) {
                throw new EntityNotFoundException("El horario con id " + id + " no existe.");
            }
            throw ex;
        } finally {
            if (em != null) em.close();
        }
    }

    /* DELETE */
    public void destroy(int id) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Horario horario;
            try {
                horario = em.getReference(Horario.class, id);
                horario.getId_horario();
            } catch (EntityNotFoundException enfe) {
                throw new EntityNotFoundException("El horario no existe.");
            }
            em.remove(horario);
            em.getTransaction().commit();
        } finally {
            if (em != null) em.close();
        }
    }

    /* FIND ALL */
    public List<Horario> findHorarioEntities() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Horario.class));
            Query q = em.createQuery(cq);
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    /* FIND ONE */
    public Horario findHorario(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Horario.class, id);
        } finally {
            em.close();
        }
    }
}
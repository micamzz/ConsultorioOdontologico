package persistencia;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import logica.Odontologo;

public class OdontologoJpaController implements Serializable {

    private static final long serialVersionUID = 1L;

    public OdontologoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    // CONSTRUCTOR JPA  
    public OdontologoJpaController() {
        emf = Persistence.createEntityManagerFactory("ClinicaOdontologica");
    }

    /* CREATE */
    public void create(Odontologo odontologo) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(odontologo);   /* Guarda el odontologo y sus relaciones 1 a 1 */
            em.getTransaction().commit();
        } finally {
            if (em != null) em.close();
        }
    }

    /* EDIT */
    public void edit(Odontologo odontologo) throws Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            odontologo = em.merge(odontologo); /*  Actualiza los datos del odontologo */
            em.getTransaction().commit();
        } catch (Exception ex) {
            int id = odontologo.getId();
            if (findOdontologo(id) == null) {
                throw new EntityNotFoundException("El odontologo con id " + id + " no existe.");
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
            Odontologo odontologo;
            try {
                odontologo = em.getReference(Odontologo.class, id);
                odontologo.getId();
            } catch (EntityNotFoundException enfe) {
                throw new EntityNotFoundException("El odontologo no existe.");
            }
            em.remove(odontologo);
            em.getTransaction().commit();
        } finally {
            if (em != null) em.close();
        }
    }

    /* FIND ALL */
    public List<Odontologo> findOdontologoEntities() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Odontologo.class));
            Query q = em.createQuery(cq);
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    /* FIND ONE */
    public Odontologo findOdontologo(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Odontologo.class, id);
        } finally {
            em.close();
        }
    }
}
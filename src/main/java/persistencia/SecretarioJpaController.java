package persistencia;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import logica.Secretario;

public class SecretarioJpaController implements Serializable {

    private static final long serialVersionUID = 1L;

    public SecretarioJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public SecretarioJpaController() {
        emf = Persistence.createEntityManagerFactory("ClinicaOdontologica");
    }

    /* CREATE */
    public void create(Secretario secretario) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(secretario);
            em.getTransaction().commit();
        } finally {
            if (em != null) em.close();
        }
    }

    /* EDIT */
    public void edit(Secretario secretario) throws Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            secretario = em.merge(secretario);
            em.getTransaction().commit();
        } catch (Exception ex) {
            int id = secretario.getId();
            if (findSecretario(id) == null) {
                throw new EntityNotFoundException("El secretario con id " + id + " no existe.");
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
            Secretario secretario;
            try {
                secretario = em.getReference(Secretario.class, id);
                secretario.getId();
            } catch (EntityNotFoundException enfe) {
                throw new EntityNotFoundException("El secretario no existe.");
            }
            em.remove(secretario);
            em.getTransaction().commit();
        } finally {
            if (em != null) em.close();
        }
    }

    /* FIND ALL */
    public List<Secretario> findSecretarioEntities() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Secretario.class));
            Query q = em.createQuery(cq);
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    /* FIND ONE */
    public Secretario findSecretario(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Secretario.class, id);
        } finally {
            em.close();
        }
    }
}
package persistencia;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import logica.Persona;

public class PersonaJpaController implements Serializable {

    private static final long serialVersionUID = 1L;

    public PersonaJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public PersonaJpaController() {
        emf = Persistence.createEntityManagerFactory("ClinicaOdontologica");
    }

    /* CREATE */
    public void create(Persona persona) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(persona);
            em.getTransaction().commit();
        } finally {
            if (em != null) em.close();
        }
    }

    /* EDIT */
    public void edit(Persona persona) throws Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            persona = em.merge(persona);
            em.getTransaction().commit();
        } catch (Exception ex) {
            int id = persona.getId();
            if (findPersona(id) == null) {
                throw new EntityNotFoundException("La persona con id " + id + " no existe.");
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
            Persona persona;
            try {
                persona = em.getReference(Persona.class, id);
                persona.getId();
            } catch (EntityNotFoundException enfe) {
                throw new EntityNotFoundException("La persona no existe.");
            }
            em.remove(persona);
            em.getTransaction().commit();
        } finally {
            if (em != null) em.close();
        }
    }

    /* FIND ALL */
    public List<Persona> findPersonaEntities() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Persona.class));
            Query q = em.createQuery(cq);
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    /* FIND ONE */
    public Persona findPersona(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Persona.class, id);
        } finally {
            em.close();
        }
    }
}
import React, { useState } from "react";
import "./style.css"; // Importer votre fichier CSS pour le style

const AddExamForm = () => {
  const [formData, setFormData] = useState({
    dateExam: "",
    heureDebut: "",
    semestre: "",
    session: "",
    typeExamen: "",
    epreuve: "",
    pvFile: null,
    rapportFile: null,
    dureePrevue: "",
    enseignantIds: [],
    salleIds: [],
    adminId: "",
  });

  const [enseignants, setEnseignants] = useState([
    { idPersonne: 1, nom: "Dupont", prenom: "Jean" },
    { idPersonne: 2, nom: "Doe", prenom: "Jane" },
  ]);

  const [salles, setSalles] = useState([
    { id_salle: 1, nom: "Salle 101" },
    { id_salle: 2, nom: "Salle 102" },
  ]);

  const [admins, setAdmins] = useState([
    { idPersonne: 1, nom: "Admin", prenom: "Principal" },
    { idPersonne: 2, nom: "Admin", prenom: "Secondaire" },
  ]);

  const handleChange = (e) => {
    const { name, value, files, type } = e.target;
    if (type === "file") {
      setFormData({ ...formData, [name]: files[0] });
    } else if (type === "select-multiple") {
      const options = Array.from(e.target.selectedOptions).map((opt) => opt.value);
      setFormData({ ...formData, [name]: options });
    } else {
      setFormData({ ...formData, [name]: value });
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    // Préparation des données pour l'envoi
    const submissionData = new FormData();
    for (const key in formData) {
      if (key === "enseignantIds" || key === "salleIds") {
        formData[key].forEach((id) => submissionData.append(key, id));
      } else {
        submissionData.append(key, formData[key]);
      }
    }

    // Envoi des données au backend
    try {
      const response = await fetch("/admin/Examen/addExamen", {
        method: "POST",
        body: submissionData,
      });

      if (response.ok) {
        alert("Examen ajouté avec succès !");
        setFormData({
          dateExam: "",
          heureDebut: "",
          semestre: "",
          session: "",
          typeExamen: "",
          epreuve: "",
          pvFile: null,
          rapportFile: null,
          dureePrevue: "",
          enseignantIds: [],
          salleIds: [],
          adminId: "",
        });
      } else {
        alert("Erreur lors de l'ajout de l'examen.");
      }
    } catch (error) {
      console.error("Erreur :", error);
      alert("Une erreur est survenue.");
    }
  };

  return (
    <div className="container">
      <h2>Ajouter un Examen</h2>
      <form onSubmit={handleSubmit} encType="multipart/form-data">
        <div className="form-group">
          <label htmlFor="dateExam">Date:</label>
          <input
            type="date"
            name="dateExam"
            id="dateExam"
            className="form-control"
            value={formData.dateExam}
            onChange={handleChange}
            required
          />
        </div>

        <div className="form-group">
          <label htmlFor="heureDebut">Heure de Début:</label>
          <input
            type="time"
            name="heureDebut"
            id="heureDebut"
            className="form-control"
            value={formData.heureDebut}
            onChange={handleChange}
            required
          />
        </div>

        <div className="form-group">
          <label htmlFor="semestre">Semestre:</label>
          <input
            type="text"
            name="semestre"
            id="semestre"
            className="form-control"
            value={formData.semestre}
            onChange={handleChange}
            required
          />
        </div>

        <div className="form-group">
          <label htmlFor="session">Session:</label>
          <input
            type="text"
            name="session"
            id="session"
            className="form-control"
            value={formData.session}
            onChange={handleChange}
            required
          />
        </div>

        <div className="form-group">
          <label htmlFor="typeExamen">Type:</label>
          <input
            type="text"
            name="typeExamen"
            id="typeExamen"
            className="form-control"
            value={formData.typeExamen}
            onChange={handleChange}
            required
          />
        </div>

        <div className="form-group">
          <label htmlFor="epreuve">Epreuve:</label>
          <input
            type="text"
            name="epreuve"
            id="epreuve"
            className="form-control"
            value={formData.epreuve}
            onChange={handleChange}
          />
        </div>

        <div className="form-group">
          <label htmlFor="pvFile">PV (PDF):</label>
          <input
            type="file"
            name="pvFile"
            id="pvFile"
            className="form-control"
            accept="application/pdf"
            onChange={handleChange}
          />
        </div>

        <div className="form-group">
          <label htmlFor="rapportFile">Rapport Textuel (PDF):</label>
          <input
            type="file"
            name="rapportFile"
            id="rapportFile"
            className="form-control"
            accept="application/pdf"
            onChange={handleChange}
          />
        </div>

        <div className="form-group">
          <label htmlFor="dureePrevue">Durée Prévue:</label>
          <input
            type="number"
            name="dureePrevue"
            id="dureePrevue"
            className="form-control"
            value={formData.dureePrevue}
            onChange={handleChange}
            required
          />
        </div>

        <div className="form-group">
          <label htmlFor="enseignantIds">Enseignants:</label>
          <select
            name="enseignantIds"
            id="enseignantIds"
            className="form-control"
            multiple
            value={formData.enseignantIds}
            onChange={handleChange}
          >
            {enseignants.map((enseignant) => (
              <option key={enseignant.idPersonne} value={enseignant.idPersonne}>
                {enseignant.nom} {enseignant.prenom}
              </option>
            ))}
          </select>
        </div>

        <div className="form-group">
          <label htmlFor="salleIds">Salles:</label>
          <select
            name="salleIds"
            id="salleIds"
            className="form-control"
            multiple
            value={formData.salleIds}
            onChange={handleChange}
          >
            {salles.map((salle) => (
              <option key={salle.id_salle} value={salle.id_salle}>
                {salle.nom}
              </option>
            ))}
          </select>
        </div>

        <div className="form-group">
          <label htmlFor="adminId">Admin:</label>
          <select
            name="adminId"
            id="adminId"
            className="form-control"
            value={formData.adminId}
            onChange={handleChange}
          >
            {admins.map((admin) => (
              <option key={admin.idPersonne} value={admin.idPersonne}>
                {admin.nom} {admin.prenom}
              </option>
            ))}
          </select>
        </div>

        <button type="submit" className="btn btn-primary">
          Ajouter Examen
        </button>
      </form>
    </div>
  );
};

export default AddExamForm;

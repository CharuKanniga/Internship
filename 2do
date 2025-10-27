import React, { useState } from "react";

function ToDoApp() {
  const [task, setTask] = useState("");
  const [tasks, setTasks] = useState([]);
  const [editIndex, setEditIndex] = useState(null);

  const handleAdd = () => {
    if (task.trim() === "") return;
    if (editIndex !== null) {
      const updated = [...tasks];
      updated[editIndex] = task;
      setTasks(updated);
      setEditIndex(null);
    } else {
      setTasks([...tasks, task]);
    }
    setTask("");
  };

  const handleEdit = (i) => {
    setTask(tasks[i]);
    setEditIndex(i);
  };

  const handleDelete = (i) => {
    setTasks(tasks.filter((_, index) => index !== i));
  };

  return (
    <>
      <h1>To-Do List</h1>
      <input
        placeholder="Enter task"
        value={task}
        onChange={(e) => setTask(e.target.value)}
      />
      <button onClick={handleAdd}>{editIndex !== null ? "Update" : "Add"}</button>

      <ul>
        {tasks.map((t, i) => (
          <li key={i}>
            {t}{" "}
            <button onClick={() => handleEdit(i)}>Edit</button>
            <button onClick={() => handleDelete(i)}>Delete</button>
          </li>
        ))}
      </ul>
    </>
  );
}

export default ToDoApp;

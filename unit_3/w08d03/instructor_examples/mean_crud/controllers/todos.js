var express = require('express');
var router = express.Router();
var Todos = require('../models/todos.js');

router.post('/', function(req, res){
    Todos.create(req.body, function(err, createdTodo){
        res.json(createdTodo);
    });
});

router.get('/', function(req, res){
    Todos.find({}, function(err, foundTodos){
        res.json(foundTodos);
    });
});

router.delete('/:id', function(req, res){
    Todos.findByIdAndRemove(req.params.id, function(err, deletedTodo){
        res.json(deletedTodo);
    });
});

router.put('/:id', function(req, res){
    //                      which item  -  new values - return updated   -  callback function
    Todos.findByIdAndUpdate(req.params.id, req.body, {new:true}, function(err, updatedTodo){
        res.json(updatedTodo);
    });
})

module.exports = router;

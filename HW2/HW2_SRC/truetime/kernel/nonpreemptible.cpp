/*
 * Copyright (c) 2016 Lund University
 *
 * Written by Anton Cervin, Dan Henriksson and Martin Ohlin,
 * Department of Automatic Control LTH, Lund University, Sweden.
 *   
 * This file is part of TrueTime 2.0.
 *
 * TrueTime 2.0 is free software: you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * TrueTime 2.0 is distributed in the hope that it will be useful, but
 * without any warranty; without even the implied warranty of
 * merchantability or fitness for a particular purpose. See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with TrueTime 2.0. If not, see <http://www.gnu.org/licenses/>
 */

#ifndef NON_PREEMPTIBLE
#define NON_PREEMPTIBLE

#include "getnode.cpp"

void ttNonPreemptible(const char* nameOfTask) {

  DataNode* dn = getNode(nameOfTask, rtsys->taskList);
  if (dn == NULL) {
    dn = getNode(nameOfTask, rtsys->handlerList);
    if (dn == NULL) {
      char buf[200];
      sprintf(buf, "ttNonPreemptible: Non-existent task '%s'!", nameOfTask);
      TT_MEX_ERROR(buf);
      return;
    }
  }

  Task* task = (Task*) dn->data; 
  task->nonpreemptible = true;
}

#endif

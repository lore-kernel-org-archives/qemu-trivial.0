Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ry0GV-0008Od-JA
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2012 07:16:47 -0500
Received: from eggs.gnu.org ([140.186.70.92]:55190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Alexander_Barabash@mentor.com>) id 1Ry0GP-0008OL-M1
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 07:16:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Alexander_Barabash@mentor.com>) id 1Ry0GK-0008BQ-VN
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 07:16:41 -0500
Received: from relay1.mentorg.com ([192.94.38.131]:55339)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Alexander_Barabash@mentor.com>) id 1Ry0GK-0008Ay-PQ
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 07:16:36 -0500
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Ry0GH-0007Qg-9r from Alexander_Barabash@mentor.com 
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 04:16:33 -0800
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 16 Feb 2012 04:15:51 -0800
Received: from [137.202.52.68] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.1.289.1; Thu, 16 Feb 2012 12:16:31 +0000
Message-ID: <4F3CF3B4.2050700@mentor.com>
Date: Thu, 16 Feb 2012 14:16:52 +0200
From: Alexander Barabash <alexander_barabash@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 16 Feb 2012 12:15:51.0281 (UTC)
	FILETIME=[B932D610:01CCECA4]
X-detected-operating-system: by eggs.gnu.org: Solaris 10 (beta)
X-Received-From: 192.94.38.131
Subject: [Qemu-trivial] [PATCH] Replace object_delete() with object_unref().
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Feb 2012 12:16:45 -0000


     Replace object_delete() with object_unref().

     In the existing implementation, object_delete()
     calls object_unref(), then frees the object's storage.
     Running object_delete() on an object with reference count
     different from one (1) causes program failure.

     In the existing implementation, object_unref()
     finalizes the object when its reference count becomes zero (0).

     In the new implementation, object_unref()
     finalizes and frees the object's storage when the reference count 
becomes zero (0).

     One usage of object_delete() replaced by object_unref().

     Signed-off-by: Alexander Barabash <alexander_barabash@mentor.com>

diff --git a/hw/qdev.c b/hw/qdev.c
index f0eb3a7..891981a 100644
--- a/hw/qdev.c
+++ b/hw/qdev.c
@@ -247,7 +247,7 @@ void qdev_init_nofail(DeviceState *dev)
  /* Unlink device from bus and free the structure.  */
  void qdev_free(DeviceState *dev)
  {
-    object_delete(OBJECT(dev));
+    object_unref(OBJECT(dev));
  }

  void qdev_machine_creation_done(void)
diff --git a/include/qemu/object.h b/include/qemu/object.h
index 69cc2ab..e7e32fe 100644
--- a/include/qemu/object.h
+++ b/include/qemu/object.h
@@ -415,8 +415,9 @@ struct InterfaceInfo
   * object_new:
   * @typename: The name of the type of the object to instantiate.
   *
- * This function will initialize a new object using heap allocated 
memory.  This
- * function should be paired with object_delete() to free the resources
+ * This function will initialize a new object using heap allocated memory.
+ * The object's reference count will be set to one (1) upon successful 
completion.
+ * This function should be paired with object_unref() to free the resources
   * associated with the object.
   *
   * Returns: The newly allocated and instantiated object.
@@ -427,8 +428,9 @@ Object *object_new(const char *typename);
   * object_new_with_type:
   * @type: The type of the object to instantiate.
   *
- * This function will initialize a new object using heap allocated 
memory.  This
- * function should be paired with object_delete() to free the resources
+ * This function will initialize a new object using heap allocated memory.
+ * The object's reference count will be set to one (1) upon successful 
completion.
+ * This function should be paired with object_unref() to free the resources
   * associated with the object.
   *
   * Returns: The newly allocated and instantiated object.
@@ -436,15 +438,6 @@ Object *object_new(const char *typename);
  Object *object_new_with_type(Type type);

  /**
- * object_delete:
- * @obj: The object to free.
- *
- * Finalize an object and then free the memory associated with it.  
This should
- * be paired with object_new() to free the resources associated with an 
object.
- */
-void object_delete(Object *obj);
-
-/**
   * object_initialize_with_type:
   * @obj: A pointer to the memory to be used for the object.
   * @type: The type of the object to instantiate.
@@ -573,8 +566,10 @@ void object_ref(Object *obj);
   * qdef_unref:
   * @obj: the object
   *
- * Decrease the reference count of a object.  A object cannot be freed 
as long
+ * Decrease the reference count of a object.  A object is not freed as long
   * as its reference count is greater than zero.
+ * Once an object's reference count gets to zero (0),
+ * the object is finalized and the memory associated with it is freed.
   */
  void object_unref(Object *obj);

diff --git a/qom/object.c b/qom/object.c
index 0cbd9bb..2de6eaf 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -328,7 +328,7 @@ static void object_deinit(Object *obj, TypeImpl *type)
      while (obj->interfaces) {
          Interface *iface_obj = obj->interfaces->data;
          obj->interfaces = g_slist_delete_link(obj->interfaces, 
obj->interfaces);
-        object_delete(OBJECT(iface_obj));
+        object_unref(OBJECT(iface_obj));
      }

      if (type_has_parent(type)) {
@@ -369,13 +369,6 @@ Object *object_new(const char *typename)
      return object_new_with_type(ti);
  }

-void object_delete(Object *obj)
-{
-    object_unref(obj);
-    g_assert(obj->ref == 0);
-    g_free(obj);
-}
-
  static bool type_is_ancestor(TypeImpl *type, TypeImpl *target_type)
  {
      assert(target_type);
@@ -583,6 +576,7 @@ void object_unref(Object *obj)
      /* parent always holds a reference to its children */
      if (obj->ref == 0) {
          object_finalize(obj);
+        g_free(obj);
      }
  }




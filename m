Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ry5IF-0006OU-2o
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2012 12:38:55 -0500
Received: from eggs.gnu.org ([140.186.70.92]:47643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Alexander_Barabash@mentor.com>) id 1Ry5I7-0006Nd-Vi
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 12:38:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Alexander_Barabash@mentor.com>) id 1Ry5I2-0003DH-2y
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 12:38:47 -0500
Received: from relay1.mentorg.com ([192.94.38.131]:37996)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Alexander_Barabash@mentor.com>)
	id 1Ry5Ho-0003AK-7C; Thu, 16 Feb 2012 12:38:28 -0500
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Ry5Hn-0007JN-IP from Alexander_Barabash@mentor.com ;
	Thu, 16 Feb 2012 09:38:27 -0800
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 16 Feb 2012 09:38:27 -0800
Received: from [137.202.52.68] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.1.289.1; Thu, 16 Feb 2012 17:38:25 +0000
Message-ID: <4F3D3F26.8010402@mentor.com>
Date: Thu, 16 Feb 2012 19:38:46 +0200
From: Alexander Barabash <alexander_barabash@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 16 Feb 2012 17:38:27.0464 (UTC)
	FILETIME=[CA61F880:01CCECD1]
X-detected-operating-system: by eggs.gnu.org: Solaris 10 (beta)
X-Received-From: 192.94.38.131
Subject: [Qemu-trivial] [PATCH] [TRIVIAL] Replace object_delete() with
	object_unref().
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
X-List-Received-Date: Thu, 16 Feb 2012 17:38:53 -0000


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




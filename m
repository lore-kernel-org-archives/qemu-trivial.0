Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ry5Nc-0007id-NB
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2012 12:44:28 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Alexander_Barabash@mentor.com>) id 1Ry5NT-0007MF-KX
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 12:44:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Alexander_Barabash@mentor.com>) id 1Ry5Iq-0003ek-Mb
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2012 12:40:23 -0500
Received: from relay1.mentorg.com ([192.94.38.131]:38141)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Alexander_Barabash@mentor.com>)
	id 1Ry5Iq-0003eA-CD; Thu, 16 Feb 2012 12:39:32 -0500
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Ry5Ip-0007Pg-LV from Alexander_Barabash@mentor.com ;
	Thu, 16 Feb 2012 09:39:31 -0800
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 16 Feb 2012 09:38:48 -0800
Received: from [137.202.52.68] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.1.289.1; Thu, 16 Feb 2012 17:39:30 +0000
Message-ID: <4F3D3F67.9050506@mentor.com>
Date: Thu, 16 Feb 2012 19:39:51 +0200
From: Alexander Barabash <alexander_barabash@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 16 Feb 2012 17:38:48.0531 (UTC)
	FILETIME=[D6F08A30:01CCECD1]
X-detected-operating-system: by eggs.gnu.org: Solaris 10 (beta)
X-Received-From: 192.94.38.131
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] Add object_property_get_child().
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
X-List-Received-Date: Thu, 16 Feb 2012 17:44:26 -0000


     Add object_property_get_child().

     Adding a direct accessor to a child property.

     In the existing implementation, object_property_get() must be used,
     with with a visitor, implementing the 'type_str' callback,
     receiving the child's canonical path.

     In the new implementation, the child is returned directly.
     Link properties are resolved in the same way, as they are
     when an absolute path is resolved.

     Errors relevant to the operation, QERR_OBJECT_PROPERTY_NOT_FOUND
     and QERR_OBJECT_PROPERTY_INVALID_TYPE were added.

     Also, in the new implementation, some common sense refactoring was done
     in the file 'qom/object.c' in the code extracting child and link 
properties.

     Signed-off-by: Alexander Barabash <alexander_barabash@mentor.com>

diff --git a/include/qemu/object.h b/include/qemu/object.h
index e7e32fe..190f422 100644
--- a/include/qemu/object.h
+++ b/include/qemu/object.h
@@ -711,6 +711,21 @@ int64_t object_property_get_int(Object *obj, const 
char *name,
                                  struct Error **errp);

  /**
+ * object_property_get_child:
+ * @obj: the object
+ * @name: the name of the property
+ * @errp: returns an error if this function fails
+ *
+ * Returns: if this a child property, the value of the property, or NULL if
+ * an error occurs (including when the property value is not a child 
property).
+ *
+ * Result's reference count does not change.
+ * Therefore, he caller is responsible for referencing the result.
+ */
+Object *object_property_get_child(Object *obj, const char *name,
+                                  struct Error **errp);
+
+/**
   * object_property_set:
   * @obj: the object
   * @v: the visitor that will be used to write the property value.  
This should
diff --git a/qerror.h b/qerror.h
index e26c635..45e4468 100644
--- a/qerror.h
+++ b/qerror.h
@@ -178,6 +178,12 @@ QError *qobject_to_qerror(const QObject *obj);
  #define QERR_NOT_SUPPORTED \
      "{ 'class': 'NotSupported', 'data': {} }"

+#define QERR_OBJECT_PROPERTY_NOT_FOUND \
+    "{ 'class': 'ObjectPropertyNotFound', 'data': { 'object': %s, 
'property': %s } }"
+
+#define QERR_OBJECT_PROPERTY_INVALID_TYPE \
+    "{ 'class': 'ObjectPropertyInvalidType', 'data': { 'object': %s, 
'property': %s, 'expected_type': %s } }"
+
  #define QERR_OPEN_FILE_FAILED \
      "{ 'class': 'OpenFileFailed', 'data': { 'filename': %s } }"

diff --git a/qom/object.c b/qom/object.c
index 2de6eaf..61e775b 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -297,12 +297,86 @@ static void object_property_del_all(Object *obj)
      }
  }

+/*
+ * To ensure correct format checking,
+ * this function should be used only via REPORT_OBJECT_ERROR() macro.
+ *
+ * The first argument after 'obj' should be of type 'const char *'.
+ * It is ignored, and replaced by the canonical path of 'obj'.
+ */
+static void report_object_error(Error **errp, const char *fmt, Object 
*obj, ...)
+    GCC_FMT_ATTR(2, 4);
+static void report_object_error(Error **errp, const char *fmt, Object 
*obj, ...)
+{
+    gchar *path;
+    va_list ap;
+
+    if (errp != NULL) {
+        path = object_get_canonical_path(obj);
+        va_start(ap, obj);
+        va_arg(ap, const char *); /* Ignore the dummy string. */
+        error_set(errp, fmt, path, &ap);
+        va_end(ap);
+        g_free(path);
+    }
+}
+#define REPORT_OBJECT_ERROR(errp, fmt, obj, ...)                 \
+    do {                                                         \
+        report_object_error(errp, fmt, obj, "", ## __VA_ARGS__); \
+    } while (0)
+
+#define CHILD_PROPERTY_TYPE_PREFIX "child<"
+#define CHILD_PROPERTY_TYPE_SUFFIX ">"
+#define LINK_PROPERTY_TYPE_PREFIX "link<"
+#define LINK_PROPERTY_TYPE_SUFFIX ">"
+
+static bool object_property_is_child(ObjectProperty *prop)
+{
+    return (strstart(prop->type, CHILD_PROPERTY_TYPE_PREFIX, NULL) != 0);
+}
+
+static bool object_property_is_link(ObjectProperty *prop)
+{
+    return (strstart(prop->type, LINK_PROPERTY_TYPE_PREFIX, NULL) != 0);
+}
+
+/* Go from LINK_PROPERTY_TYPE_PREFIX FOO LINK_PROPERTY_TYPE_SUFFIX to 
FOO.  */
+static gchar *link_type_to_type(const gchar *type)
+{
+    return g_strndup(&type[sizeof(LINK_PROPERTY_TYPE_PREFIX) - 1],
+                     strlen(type)
+                     - (sizeof(LINK_PROPERTY_TYPE_PREFIX) - 1)
+                     - (sizeof(LINK_PROPERTY_TYPE_SUFFIX) - 1));
+}
+
+static Object *object_property_extract_child(ObjectProperty *prop,
+                                             bool *p_is_invalid_type)
+{
+    if (p_is_invalid_type != NULL) {
+        *p_is_invalid_type = false;
+    }
+    if (object_property_is_child(prop)) {
+        return (Object *)prop->opaque;
+    } else if (object_property_is_link(prop)) {
+        if (prop->opaque != NULL) {
+            return *(Object **)prop->opaque;
+        } else {
+            return NULL;
+        }
+    } else {
+        if (p_is_invalid_type != NULL) {
+            *p_is_invalid_type = true;
+        }
+        return NULL;
+    }
+}
+
  static void object_property_del_child(Object *obj, Object *child, 
Error **errp)
  {
      ObjectProperty *prop;

      QTAILQ_FOREACH(prop, &obj->properties, node) {
-        if (!strstart(prop->type, "child<", NULL)) {
+        if (!object_property_is_child(prop)) {
              continue;
          }

@@ -799,6 +873,27 @@ Object *object_get_root(void)
      return root;
  }

+Object *object_property_get_child(Object *obj, const char *name,
+                                  struct Error **errp) {
+    Object *result = NULL;
+    ObjectProperty *prop = object_property_find(obj, name);
+    bool is_invalid_type;
+
+    if (prop == NULL) {
+        REPORT_OBJECT_ERROR(errp, QERR_OBJECT_PROPERTY_NOT_FOUND, obj, 
name);
+        return NULL;
+    }
+
+    result = object_property_extract_child(prop, &is_invalid_type);
+    if (is_invalid_type) {
+        REPORT_OBJECT_ERROR(errp, QERR_OBJECT_PROPERTY_INVALID_TYPE,
+                            obj, name, "child");
+        return NULL;
+    }
+
+    return result;
+}
+
  static void object_get_child_property(Object *obj, Visitor *v, void 
*opaque,
                                        const char *name, Error **errp)
  {
@@ -829,7 +924,10 @@ void object_property_add_child(Object *obj, const 
char *name,
       */
      assert(!object_is_type(obj, type_interface));

-    type = g_strdup_printf("child<%s>", 
object_get_typename(OBJECT(child)));
+    type = g_strdup_printf(CHILD_PROPERTY_TYPE_PREFIX
+                           "%s"
+                           CHILD_PROPERTY_TYPE_SUFFIX,
+                           object_get_typename(OBJECT(child)));

      object_property_add(obj, name, type, object_get_child_property,
                          NULL, object_finalize_child_property, child, 
errp);
@@ -878,8 +976,7 @@ static void object_set_link_property(Object *obj, 
Visitor *v, void *opaque,
      if (strcmp(path, "") != 0) {
          Object *target;

-        /* Go from link<FOO> to FOO.  */
-        target_type = g_strndup(&type[5], strlen(type) - 6);
+        target_type = link_type_to_type(type);
          target = object_resolve_path_type(path, target_type, &ambiguous);

          if (ambiguous) {
@@ -907,7 +1004,9 @@ void object_property_add_link(Object *obj, const 
char *name,
  {
      gchar *full_type;

-    full_type = g_strdup_printf("link<%s>", type);
+    full_type = g_strdup_printf(LINK_PROPERTY_TYPE_PREFIX
+                                "%s"
+                                LINK_PROPERTY_TYPE_SUFFIX, type);

      object_property_add(obj, name, full_type,
                          object_get_link_property,
@@ -932,7 +1031,7 @@ gchar *object_get_canonical_path(Object *obj)
          g_assert(obj->parent != NULL);

          QTAILQ_FOREACH(prop, &obj->parent->properties, node) {
-            if (!strstart(prop->type, "child<", NULL)) {
+            if (!object_property_is_child(prop)) {
                  continue;
              }

@@ -980,15 +1079,7 @@ static Object *object_resolve_abs_path(Object *parent,
          return NULL;
      }

-    child = NULL;
-    if (strstart(prop->type, "link<", NULL)) {
-        Object **pchild = prop->opaque;
-        if (*pchild) {
-            child = *pchild;
-        }
-    } else if (strstart(prop->type, "child<", NULL)) {
-        child = prop->opaque;
-    }
+    child = object_property_extract_child(prop, NULL);

      if (!child) {
          return NULL;
@@ -1010,7 +1101,7 @@ static Object *object_resolve_partial_path(Object 
*parent,
      QTAILQ_FOREACH(prop, &parent->properties, node) {
          Object *found;

-        if (!strstart(prop->type, "child<", NULL)) {
+        if (!object_property_is_child(prop)) {
              continue;
          }




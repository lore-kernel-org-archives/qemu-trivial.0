Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RqRhP-0003ha-Bu
	for mharc-qemu-trivial@gnu.org; Thu, 26 Jan 2012 10:57:19 -0500
Received: from eggs.gnu.org ([140.186.70.92]:55701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RqRhK-0003P4-7a
	for qemu-trivial@nongnu.org; Thu, 26 Jan 2012 10:57:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RqRhD-0006Uu-95
	for qemu-trivial@nongnu.org; Thu, 26 Jan 2012 10:57:14 -0500
Received: from cantor2.suse.de ([195.135.220.15]:34248 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1RqRh4-0006UB-Kb; Thu, 26 Jan 2012 10:56:58 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 41D628BB22;
	Thu, 26 Jan 2012 16:56:57 +0100 (CET)
From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To: qemu-devel@nongnu.org
Date: Thu, 26 Jan 2012 16:54:48 +0100
Message-Id: <1327593288-22521-1-git-send-email-afaerber@suse.de>
X-Mailer: git-send-email 1.7.7
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: Kevin Wolf <kwolf@redhat.com>, Blue Swirl <blauwirbel@gmail.com>,
	Anthony Liguori <aliguori@us.ibm.com>,
	Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
	Jan Kiszka <jan.kiszka@siemens.com>, Markus Armbruster <armbru@redhat.com>,
	Vasilis Liaskovitis <vasilis.liaskovitis@profitbricks.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
	Amit Shah <amit.shah@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH v8] qdev: Add support for property type bool
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
X-List-Received-Date: Thu, 26 Jan 2012 15:57:18 -0000

From: Andreas F=C3=A4rber <andreas.faerber@web.de>

VMState supports the type bool but qdev instead supports bit, backed by
uint32_t. Therefore let's add PROP_TYPE_BOOL and qdev_prop_set_bool().

With non-programmers in mind, instead of universal true/false provide
two different property types:
* on/off for DEFINE_PROP_SWITCH() (requested by Jan) and
* yes/no for DEFINE_PROP_BOOL() (also accepting true/false as input).

Signed-off-by: Andreas F=C3=A4rber <andreas.faerber@web.de>
Cc: Juan Quintela <quintela@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Vasilis Liaskovitis <vasilis.liaskovitis@profitbricks.com>
---
 v7 -> v8:
 * Add missing extern qdev_prop_bool_switch for DEFINE_PROP_SWITCH().

 v6 -> v7:
 * Rename existing "boolean" type to "bit".
 * Re-introduce qdev_prop_set_bool().
 * Split "bool" into "switch" (on/off) and "boolean" (yes/no; true/false =
input).

 v5 -> v6:
 * Rebased onto QOM properties.
 * Parse and print true/false for bool, leave bit untouched.
 Please review, v6 untested.
 [* Accidentally dropped qdev_prop_set_bool().]

 v4 -> v5 (40P):
 * Parse on/off in addition to yes/no for both bit and bool, print yes/no=
 for bool.

 v4 (ISA):
 * Introduced.
 hw/qdev-properties.c |  102 ++++++++++++++++++++++++++++++++++++++++++++=
+++++-
 hw/qdev.h            |    8 ++++
 2 files changed, 109 insertions(+), 1 deletions(-)

diff --git a/hw/qdev-properties.c b/hw/qdev-properties.c
index 02f0dae..0b1e9ea 100644
--- a/hw/qdev-properties.c
+++ b/hw/qdev-properties.c
@@ -86,7 +86,7 @@ static void set_bit(DeviceState *dev, Visitor *v, void =
*opaque,
 }
=20
 PropertyInfo qdev_prop_bit =3D {
-    .name  =3D "boolean",
+    .name  =3D "bit",
     .legacy_name  =3D "on/off",
     .type  =3D PROP_TYPE_BIT,
     .size  =3D sizeof(uint32_t),
@@ -96,6 +96,101 @@ PropertyInfo qdev_prop_bit =3D {
     .set   =3D set_bit,
 };
=20
+/* --- bool --- */
+
+static int parse_bool(DeviceState *dev, Property *prop, const char *str)
+{
+    bool *ptr =3D qdev_get_prop_ptr(dev, prop);
+    if (strcmp(str, "true") =3D=3D 0 || strcmp(str, "yes") =3D=3D 0) {
+        *ptr =3D true;
+    } else if (strcmp(str, "false") =3D=3D 0 || strcmp(str, "no") =3D=3D=
 0) {
+        *ptr =3D false;
+    } else {
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int parse_bool_switch(DeviceState *dev, Property *prop,
+                             const char *str)
+{
+    bool *ptr =3D qdev_get_prop_ptr(dev, prop);
+    if (strcmp(str, "on") =3D=3D 0) {
+        *ptr =3D true;
+    } else if (strcmp(str, "off") =3D=3D 0) {
+        *ptr =3D false;
+    } else {
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int print_bool(DeviceState *dev, Property *prop,
+                      char *dest, size_t len)
+{
+    bool *ptr =3D qdev_get_prop_ptr(dev, prop);
+    return snprintf(dest, len, *ptr ? "yes" : "no");
+}
+
+static int print_bool_switch(DeviceState *dev, Property *prop,
+                             char *dest, size_t len)
+{
+    bool *ptr =3D qdev_get_prop_ptr(dev, prop);
+    return snprintf(dest, len, *ptr ? "on" : "off");
+}
+
+static void get_bool(DeviceState *dev, Visitor *v, void *opaque,
+                     const char *name, Error **errp)
+{
+    Property *prop =3D opaque;
+    bool *ptr =3D qdev_get_prop_ptr(dev, prop);
+
+    visit_type_bool(v, ptr, name, errp);
+}
+
+static void set_bool(DeviceState *dev, Visitor *v, void *opaque,
+                     const char *name, Error **errp)
+{
+    Property *prop =3D opaque;
+    bool *ptr =3D qdev_get_prop_ptr(dev, prop);
+    Error *local_err =3D NULL;
+    bool value;
+
+    if (dev->state !=3D DEV_STATE_CREATED) {
+        error_set(errp, QERR_PERMISSION_DENIED);
+        return;
+    }
+
+    visit_type_bool(v, &value, name, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+    *ptr =3D value;
+}
+
+PropertyInfo qdev_prop_bool =3D {
+    .name =3D "boolean",
+    .type =3D PROP_TYPE_BOOL,
+    .size =3D sizeof(bool),
+    .parse =3D parse_bool,
+    .print =3D print_bool,
+    .get   =3D get_bool,
+    .set   =3D set_bool,
+};
+
+PropertyInfo qdev_prop_bool_switch =3D {
+    .name =3D "switch",
+    .type =3D PROP_TYPE_BOOL,
+    .size =3D sizeof(bool),
+    .parse =3D parse_bool_switch,
+    .print =3D print_bool_switch,
+    .get   =3D get_bool,
+    .set   =3D set_bool,
+};
+
 /* --- 8bit integer --- */
=20
 static int parse_uint8(DeviceState *dev, Property *prop, const char *str=
)
@@ -1055,6 +1150,11 @@ void qdev_prop_set_bit(DeviceState *dev, const cha=
r *name, bool value)
     qdev_prop_set(dev, name, &value, PROP_TYPE_BIT);
 }
=20
+void qdev_prop_set_bool(DeviceState *dev, const char *name, bool value)
+{
+    qdev_prop_set(dev, name, &value, PROP_TYPE_BOOL);
+}
+
 void qdev_prop_set_uint8(DeviceState *dev, const char *name, uint8_t val=
ue)
 {
     qdev_prop_set(dev, name, &value, PROP_TYPE_UINT8);
diff --git a/hw/qdev.h b/hw/qdev.h
index 6b58dd8..cef20f6 100644
--- a/hw/qdev.h
+++ b/hw/qdev.h
@@ -152,6 +152,7 @@ enum PropertyType {
     PROP_TYPE_VLAN,
     PROP_TYPE_PTR,
     PROP_TYPE_BIT,
+    PROP_TYPE_BOOL,
 };
=20
 struct PropertyInfo {
@@ -276,6 +277,8 @@ int do_device_del(Monitor *mon, const QDict *qdict, Q=
Object **ret_data);
 /*** qdev-properties.c ***/
=20
 extern PropertyInfo qdev_prop_bit;
+extern PropertyInfo qdev_prop_bool;
+extern PropertyInfo qdev_prop_bool_switch;
 extern PropertyInfo qdev_prop_uint8;
 extern PropertyInfo qdev_prop_uint16;
 extern PropertyInfo qdev_prop_uint32;
@@ -315,6 +318,10 @@ extern PropertyInfo qdev_prop_pci_devfn;
         .defval    =3D (bool[]) { (_defval) },                     \
         }
=20
+#define DEFINE_PROP_BOOL(_n, _s, _f, _d)                        \
+    DEFINE_PROP_DEFAULT(_n, _s, _f, _d, qdev_prop_bool, bool)
+#define DEFINE_PROP_SWITCH(_n, _s, _f, _d)                      \
+    DEFINE_PROP_DEFAULT(_n, _s, _f, _d, qdev_prop_bool_switch, bool)
 #define DEFINE_PROP_UINT8(_n, _s, _f, _d)                       \
     DEFINE_PROP_DEFAULT(_n, _s, _f, _d, qdev_prop_uint8, uint8_t)
 #define DEFINE_PROP_UINT16(_n, _s, _f, _d)                      \
@@ -358,6 +365,7 @@ int qdev_prop_exists(DeviceState *dev, const char *na=
me);
 int qdev_prop_parse(DeviceState *dev, const char *name, const char *valu=
e);
 void qdev_prop_set(DeviceState *dev, const char *name, void *src, enum P=
ropertyType type);
 void qdev_prop_set_bit(DeviceState *dev, const char *name, bool value);
+void qdev_prop_set_bool(DeviceState *dev, const char *name, bool value);
 void qdev_prop_set_uint8(DeviceState *dev, const char *name, uint8_t val=
ue);
 void qdev_prop_set_uint16(DeviceState *dev, const char *name, uint16_t v=
alue);
 void qdev_prop_set_uint32(DeviceState *dev, const char *name, uint32_t v=
alue);
--=20
1.7.7



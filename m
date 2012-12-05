Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TgASZ-0000lF-7d
	for mharc-qemu-trivial@gnu.org; Wed, 05 Dec 2012 03:36:03 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1TgASQ-0000Xr-Fo
	for qemu-trivial@nongnu.org; Wed, 05 Dec 2012 03:36:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1TgASH-0001an-GP
	for qemu-trivial@nongnu.org; Wed, 05 Dec 2012 03:35:54 -0500
Received: from e23smtp03.au.ibm.com ([202.81.31.145]:53519)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1TgASG-0001a8-Mx
	for qemu-trivial@nongnu.org; Wed, 05 Dec 2012 03:35:45 -0500
Received: from /spool/local
	by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aneesh.kumar@linux.vnet.ibm.com>;
	Wed, 5 Dec 2012 18:31:50 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
	by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 5 Dec 2012 18:31:48 +1000
Received: from d23relay04.au.ibm.com (d23relay04.au.ibm.com [9.190.234.120])
	by d23dlp01.au.ibm.com (Postfix) with ESMTP id 836BD2CE804B;
	Wed,  5 Dec 2012 19:35:38 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
	by d23relay04.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	qB58Ong258327262; Wed, 5 Dec 2012 19:24:50 +1100
Received: from d23av01.au.ibm.com (loopback [127.0.0.1])
	by d23av01.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	qB58ZbCw002249; Wed, 5 Dec 2012 19:35:37 +1100
Received: from skywalker.linux.vnet.ibm.com (skywalker.in.ibm.com
	[9.124.35.157])
	by d23av01.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	qB58ZZSl002208; Wed, 5 Dec 2012 19:35:36 +1100
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "M. Mohan Kumar" <mohan@in.ibm.com>
In-Reply-To: <87y5hdejes.fsf@linux.vnet.ibm.com>
References: <1349868762-10021-1-git-send-email-pbonzini@redhat.com>
	<50759EEC.8070308@weilnetz.de> <50759F9E.3060800@redhat.com>
	<5075A0FF.3080904@weilnetz.de> <5075A420.10003@redhat.com>
	<5075A843.8020107@weilnetz.de> <5075A966.3090708@weilnetz.de>
	<871uh5tqr7.fsf@explorer.in.ibm.com> <5076BACC.7030309@redhat.com>
	<87y5hdejes.fsf@linux.vnet.ibm.com>
User-Agent: Notmuch/0.14+97~g3977b25 (http://notmuchmail.org) Emacs/24.3.50.1
	(x86_64-unknown-linux-gnu)
Date: Wed, 05 Dec 2012 14:05:35 +0530
Message-ID: <87obi8ew14.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 12120508-6102-0000-0000-000002AB492E
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 202.81.31.145
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtfs-proxy-helper: check
	return code of setfsgid/setfsuid
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
X-List-Received-Date: Wed, 05 Dec 2012 08:36:01 -0000


Hi,

I have tested the below patch. Currently i don't have a signed-off-by on
the patch. One change noted by mohan which I incorporated in the patch
is we need to call setresgid before calling setresuid. If you are ok
with this change I can send it upstream.

commit d11bb5bb31a68e3eefb4e592161978dba29137f5
Author: Paolo Bonzini <pbonini@redhat.com>
Date:   Thu Oct 11 14:20:23 2012 +0200

    virtfs-proxy-helper: use setresuid and setresgid
    
    The setfsuid and setfsgid system calls are obscure and they complicate
    the error checking (that glibc's warn_unused_result "feature" forces
    us to do).  Switch to the standard setresuid and setresgid functions.
    
    Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index f9a8270..df2a939 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -272,31 +272,76 @@ static int send_status(int sockfd, struct iovec *iovec, int status)
 /*
  * from man 7 capabilities, section
  * Effect of User ID Changes on Capabilities:
- * 4. If the file system user ID is changed from 0 to nonzero (see setfsuid(2))
- * then the following capabilities are cleared from the effective set:
- * CAP_CHOWN, CAP_DAC_OVERRIDE, CAP_DAC_READ_SEARCH,  CAP_FOWNER, CAP_FSETID,
- * CAP_LINUX_IMMUTABLE  (since  Linux 2.2.30), CAP_MAC_OVERRIDE, and CAP_MKNOD
- * (since Linux 2.2.30). If the file system UID is changed from nonzero to 0,
- * then any of these capabilities that are enabled in the permitted set
- * are enabled in the effective set.
+ * If the effective user ID is changed from nonzero to 0, then the permitted
+ * set is copied to the effective set.  If the effective user ID is changed
+ * from 0 to nonzero, then all capabilities are are cleared from the effective
+ * set.
+ *
+ * The setfsuid/setfsgid man pages warn that changing the effective user ID may
+ * expose the program to unwanted signals, but this is not true anymore: for an
+ * unprivileged (without CAP_KILL) program to send a signal, the real or
+ * effective user ID of the sending process must equal the real or saved user
+ * ID of the target process.  Even when dropping privileges, it is enough to
+ * keep the saved UID to a "privileged" value and virtfs-proxy-helper won't
+ * be exposed to signals.  So just use setresuid/setresgid.
  */
-static int setfsugid(int uid, int gid)
+static int setugid(int uid, int gid, int *suid, int *sgid)
 {
+    int retval;
+
     /*
-     * We still need DAC_OVERRIDE because  we don't change
+     * We still need DAC_OVERRIDE because we don't change
      * supplementary group ids, and hence may be subjected DAC rules
      */
     cap_value_t cap_list[] = {
         CAP_DAC_OVERRIDE,
     };
 
-    setfsgid(gid);
-    setfsuid(uid);
+    *suid = geteuid();
+    *sgid = getegid();
+
+    if (setresgid(-1, gid, *sgid) == -1) {
+        retval = -errno;
+        goto err_out;
+    }
+
+    if (setresuid(-1, uid, *suid) == -1) {
+        retval = -errno;
+        goto err_sgid;
+    }
 
     if (uid != 0 || gid != 0) {
-        return do_cap_set(cap_list, ARRAY_SIZE(cap_list), 0);
+        if (do_cap_set(cap_list, ARRAY_SIZE(cap_list), 0) < 0) {
+            retval = -errno;
+            goto err_suid;
+        }
     }
     return 0;
+
+err_suid:
+    if (setresuid(-1, *suid, *suid) == -1) {
+        abort();
+    }
+err_sgid:
+    if (setresgid(-1, *sgid, *sgid) == -1) {
+        abort();
+    }
+err_out:
+    return retval;
+}
+
+/*
+ * This is used to reset the ugid back with the saved values
+ * There is nothing much we can do checking error values here.
+ */
+static void resetugid(int suid, int sgid)
+{
+    if (setresgid(-1, sgid, sgid) == -1) {
+        abort();
+    }
+    if (setresuid(-1, suid, suid) == -1) {
+        abort();
+    }
 }
 
 /*
@@ -578,18 +623,15 @@ static int do_create_others(int type, struct iovec *iovec)
 
     v9fs_string_init(&path);
     v9fs_string_init(&oldpath);
-    cur_uid = geteuid();
-    cur_gid = getegid();
 
     retval = proxy_unmarshal(iovec, offset, "dd", &uid, &gid);
     if (retval < 0) {
         return retval;
     }
     offset += retval;
-    retval = setfsugid(uid, gid);
+    retval = setugid(uid, gid, &cur_uid, &cur_gid);
     if (retval < 0) {
-        retval = -errno;
-        goto err_out;
+        goto unmarshal_err_out;
     }
     switch (type) {
     case T_MKNOD:
@@ -619,9 +661,10 @@ static int do_create_others(int type, struct iovec *iovec)
     }
 
 err_out:
+    resetugid(cur_uid, cur_gid);
+unmarshal_err_out:
     v9fs_string_free(&path);
     v9fs_string_free(&oldpath);
-    setfsugid(cur_uid, cur_gid);
     return retval;
 }
 
@@ -641,24 +684,16 @@ static int do_create(struct iovec *iovec)
     if (ret < 0) {
         goto unmarshal_err_out;
     }
-    cur_uid = geteuid();
-    cur_gid = getegid();
-    ret = setfsugid(uid, gid);
+    ret = setugid(uid, gid, &cur_uid, &cur_gid);
     if (ret < 0) {
-        /*
-         * On failure reset back to the
-         * old uid/gid
-         */
-        ret = -errno;
-        goto err_out;
+        goto unmarshal_err_out;
     }
     ret = open(path.data, flags, mode);
     if (ret < 0) {
         ret = -errno;
     }
 
-err_out:
-    setfsugid(cur_uid, cur_gid);
+    resetugid(cur_uid, cur_gid);
 unmarshal_err_out:
     v9fs_string_free(&path);
     return ret;




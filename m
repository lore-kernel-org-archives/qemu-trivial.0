Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TMHq0-0001cL-IF
	for mharc-qemu-trivial@gnu.org; Thu, 11 Oct 2012 08:26:04 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1TMHpw-0001bb-T8
	for qemu-trivial@nongnu.org; Thu, 11 Oct 2012 08:26:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1TMHps-0001kT-64
	for qemu-trivial@nongnu.org; Thu, 11 Oct 2012 08:26:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:28812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1TMHpr-0001kH-TB; Thu, 11 Oct 2012 08:25:56 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9BCPqKK016115
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 11 Oct 2012 08:25:52 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-38.ams2.redhat.com
	[10.36.112.38])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q9BCPnvW017839; Thu, 11 Oct 2012 08:25:50 -0400
Message-ID: <5076BACC.7030309@redhat.com>
Date: Thu, 11 Oct 2012 14:25:48 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: "M. Mohan Kumar" <mohan@in.ibm.com>
References: <1349868762-10021-1-git-send-email-pbonzini@redhat.com>
	<50759EEC.8070308@weilnetz.de> <50759F9E.3060800@redhat.com>
	<5075A0FF.3080904@weilnetz.de> <5075A420.10003@redhat.com>
	<5075A843.8020107@weilnetz.de> <5075A966.3090708@weilnetz.de>
	<871uh5tqr7.fsf@explorer.in.ibm.com>
In-Reply-To: <871uh5tqr7.fsf@explorer.in.ibm.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Thu, 11 Oct 2012 12:26:03 -0000

Il 11/10/2012 09:25, M. Mohan Kumar ha scritto:
> Also as per the man page:
>        When glibc determines that the argument is not a valid user ID,
>        it will return -1 and set errno  to  EINVAL
>        without attempting the system call.
> 
> If it mean a nonexistent id by 'not a valid user ID' it may be a
> problem in virtfs case.

I think only -1 would be an invalid user ID, or perhaps a user ID >
65535 if the kernel only supports 16-bit user IDs.

Rather than dealing with the kernel, can we just use
setresuid/setresgid like in the following (untested) patch?

Paolo

ps: so far in my short life I had managed to stay away from privilege
dropping, so please review with extra care.

------------------- 8< -----------------------
From: Paolo Bonzini <pbonini@redhat.com>
Date: Thu, 11 Oct 2012 14:20:23 +0200
Subject: [PATCH] virtfs-proxy-helper: use setresuid and setresgid

The setfsuid and setfsgid system calls are obscure and they complicate
the error checking (that glibc's warn_unused_result "feature" forces
us to do).  Switch to the standard setresuid and setresgid functions.

---
diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index f9a8270..07b3b5b 100644
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
+    /*
+     * If suid/sgid are NULL, the saved uid/gid is set to the
+     * new effective uid/gid.  If they are not, the saved uid/gid
+     * is set to the current effective user id and stored into
+     * *suid and *sgid.
+     */
+    if (!suid) {
+        suid = &uid;
+    } else {
+        *suid = geteuid();
+    }
+    if (!sgid) {
+        sgid = &gid;
+    } else {
+        *sgid = getegid();
+    }
+
+    if (setresuid(-1, uid, *suid) == -1) {
+        retval = -errno;
+        goto err_out;
+    }
+    if (setresgid(-1, gid, *sgid) == -1) {
+        retval = -errno;
+        goto err_suid;
+    }
 
     if (uid != 0 || gid != 0) {
-        return do_cap_set(cap_list, ARRAY_SIZE(cap_list), 0);
+        if (do_cap_set(cap_list, ARRAY_SIZE(cap_list), 0) < 0) {
+            retval = -errno;
+            goto err_sgid;
+        }
     }
+
     return 0;
+
+err_sgid:
+    if (setresgid(-1, *sgid, *sgid) == -1) {
+        abort();
+    }
+err_suid:
+    if (setresuid(-1, *suid, *suid) == -1) {
+        abort();
+    }
+err_out:
+    return retval;
 }
 
 /*
@@ -578,17 +623,14 @@ static int do_create_others(int type, struct iovec *iovec)
 
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
         goto err_out;
     }
     switch (type) {
@@ -621,7 +663,7 @@ static int do_create_others(int type, struct iovec *iovec)
 err_out:
     v9fs_string_free(&path);
     v9fs_string_free(&oldpath);
-    setfsugid(cur_uid, cur_gid);
+    setugid(cur_uid, cur_gid, NULL, NULL);
     return retval;
 }
 
@@ -641,24 +683,17 @@ static int do_create(struct iovec *iovec)
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
+    setugid(cur_uid, cur_gid, NULL, NULL);
+
 unmarshal_err_out:
     v9fs_string_free(&path);
     return ret;

>> Am 10.10.2012 18:54, schrieb Stefan Weil:
>>> Am 10.10.2012 18:36, schrieb Paolo Bonzini:
>>>> Il 10/10/2012 18:23, Stefan Weil ha scritto:
>>>>> < 0 would be wrong because it looks like both functions never
>>>>> return negative values.
>>>>> I just wrote a small test program (see
>>>>> below) and called it with different uids with and without root
>>>>> rights. This pattern should be fine:
>>>>>
>>>>> new_uid = setfsuid(uid);
>>>>> if (new_uid != 0 && new_uid != uid) {
>>>>>    return -1;
>>>>> }
>>>> I didn't really care about this case.  I assumed that the authors knew
>>>> what they were doing...
>>>>
>>>> What I cared about is: "When glibc determines that the argument is not a
>>>>   valid  group  ID,  it will  return  -1  and set errno to EINVAL 
>>>> without
>>>> attempting the system call".
>>>
>>> I was not able to get -1 with my test program: any value which I tried
>>> seemed to work when the program was called with sudo.
>>>
>>>>
>>>> I think this would also work:
>>>>
>>>>     if (setfsuid(uid) < 0 || setfsuid(uid) != uid) {
>>>>         return -1;
>>>>     }
>>>>
>>>> but it seems wasteful to do four syscalls instead of two.
>>>>
>>>> Paolo
>>>
>>> I added a local variable in my example to avoid those extra
>>> syscalls.
>>>
>>> Your last patch v2 does not handle missing rights (no root)
>>> because in that case the functions don't return a value < 0
>>> but fail nevertheless.Calling a program which requires
>>> root privileges from a normal user account is usually a
>>> very common error. I don't know the use cases for virtfs -
>>> maybe that's no problem here.
>>>
>>> The functions have an additional problem: they don't set
>>> errno (see manpages). I tested this, and here the manpages
>>> are correct. The code in virtfs-proxy-helper expects that
>>> errno was set, so the patch must set errno = EPERM or
>>> something like that.
>>>
>>> Stefan
>>
>> Maybe the author of those code can tell us more on the
>> use cases and which errors must be handled.
>>
>> Is it necessary to use those functions at all (they are very
>> Linux specific), or can they be replaced by seteuid, setegid?
>>
>> Regards
>>
>> Stefan W.
> 



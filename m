Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFLql-0003cq-T7
	for mharc-qemu-trivial@gnu.org; Sun, 25 Jan 2015 06:59:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YFLqh-0003Q6-32
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 06:59:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>) id 1YFLqf-0006k5-Uo
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 06:59:27 -0500
Received: from out11.biz.mail.alibaba.com ([205.204.114.131]:37445)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen@sunrus.com.cn>)
	id 1YFLqU-0006ba-GW; Sun, 25 Jan 2015 06:59:14 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1045914|-1; FP=0|0|0|0|0|-1|-1|-1;
	HT=r41g03005; MF=gang.chen@sunrus.com.cn; PH=DS; RN=4; RT=4;
	SR=0; 
Received: from
	ShengShiZhuChengdeMacBook-Pro.local(mailfrom:gang.chen@sunrus.com.cn
	ip:223.72.65.110) by smtp.aliyun-inc.com(10.147.38.22);
	Sun, 25 Jan 2015 19:58:58 +0800
Message-ID: <54C4DC4E.3080306@sunrus.com.cn>
Date: Sun, 25 Jan 2015 20:06:38 +0800
From: Chen Gang S <gang.chen@sunrus.com.cn>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: riku.voipio@iki.fi, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 205.204.114.131
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] linux-user/syscall.c: Let all
 lock_user_struct() and unlock_user_struct() paired with each other
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
X-List-Received-Date: Sun, 25 Jan 2015 11:59:30 -0000

lock_user_struct() and unlock_user_struct() need always be paired with
each other, or will cause resource leak.

Also remove redundant check for 'target_mb' in abi_long do_msgrcv().

Also match the coding styles found by "./scripts/checkpatch.pl".

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 linux-user/syscall.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ec9e4fc..b2da432 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2518,8 +2518,10 @@ static inline abi_long target_to_host_semid_ds(struct semid_ds *host_sd,
 
     if (!lock_user_struct(VERIFY_READ, target_sd, target_addr, 1))
         return -TARGET_EFAULT;
-    if (target_to_host_ipc_perm(&(host_sd->sem_perm),target_addr))
+    if (target_to_host_ipc_perm(&(host_sd->sem_perm), target_addr)) {
+        unlock_user_struct(target_sd, target_addr, 0);
         return -TARGET_EFAULT;
+    }
     host_sd->sem_nsems = tswapal(target_sd->sem_nsems);
     host_sd->sem_otime = tswapal(target_sd->sem_otime);
     host_sd->sem_ctime = tswapal(target_sd->sem_ctime);
@@ -2534,8 +2536,10 @@ static inline abi_long host_to_target_semid_ds(abi_ulong target_addr,
 
     if (!lock_user_struct(VERIFY_WRITE, target_sd, target_addr, 0))
         return -TARGET_EFAULT;
-    if (host_to_target_ipc_perm(target_addr,&(host_sd->sem_perm)))
+    if (host_to_target_ipc_perm(target_addr, &(host_sd->sem_perm))) {
+        unlock_user_struct(target_sd, target_addr, 0);
         return -TARGET_EFAULT;
+    }
     target_sd->sem_nsems = tswapal(host_sd->sem_nsems);
     target_sd->sem_otime = tswapal(host_sd->sem_otime);
     target_sd->sem_ctime = tswapal(host_sd->sem_ctime);
@@ -2796,8 +2800,10 @@ static inline abi_long target_to_host_msqid_ds(struct msqid_ds *host_md,
 
     if (!lock_user_struct(VERIFY_READ, target_md, target_addr, 1))
         return -TARGET_EFAULT;
-    if (target_to_host_ipc_perm(&(host_md->msg_perm),target_addr))
+    if (target_to_host_ipc_perm(&(host_md->msg_perm), target_addr)) {
+        unlock_user_struct(target_md, target_addr, 0);
         return -TARGET_EFAULT;
+    }
     host_md->msg_stime = tswapal(target_md->msg_stime);
     host_md->msg_rtime = tswapal(target_md->msg_rtime);
     host_md->msg_ctime = tswapal(target_md->msg_ctime);
@@ -2817,8 +2823,10 @@ static inline abi_long host_to_target_msqid_ds(abi_ulong target_addr,
 
     if (!lock_user_struct(VERIFY_WRITE, target_md, target_addr, 0))
         return -TARGET_EFAULT;
-    if (host_to_target_ipc_perm(target_addr,&(host_md->msg_perm)))
+    if (host_to_target_ipc_perm(target_addr, &(host_md->msg_perm))) {
+        unlock_user_struct(target_md, target_addr, 0);
         return -TARGET_EFAULT;
+    }
     target_md->msg_stime = tswapal(host_md->msg_stime);
     target_md->msg_rtime = tswapal(host_md->msg_rtime);
     target_md->msg_ctime = tswapal(host_md->msg_ctime);
@@ -2953,8 +2961,7 @@ static inline abi_long do_msgrcv(int msqid, abi_long msgp,
     target_mb->mtype = tswapal(host_mb->mtype);
 
 end:
-    if (target_mb)
-        unlock_user_struct(target_mb, msgp, 1);
+    unlock_user_struct(target_mb, msgp, 1);
     g_free(host_mb);
     return ret;
 }
@@ -2966,8 +2973,10 @@ static inline abi_long target_to_host_shmid_ds(struct shmid_ds *host_sd,
 
     if (!lock_user_struct(VERIFY_READ, target_sd, target_addr, 1))
         return -TARGET_EFAULT;
-    if (target_to_host_ipc_perm(&(host_sd->shm_perm), target_addr))
+    if (target_to_host_ipc_perm(&(host_sd->shm_perm), target_addr)) {
+        unlock_user_struct(target_sd, target_addr, 0);
         return -TARGET_EFAULT;
+    }
     __get_user(host_sd->shm_segsz, &target_sd->shm_segsz);
     __get_user(host_sd->shm_atime, &target_sd->shm_atime);
     __get_user(host_sd->shm_dtime, &target_sd->shm_dtime);
@@ -2986,8 +2995,10 @@ static inline abi_long host_to_target_shmid_ds(abi_ulong target_addr,
 
     if (!lock_user_struct(VERIFY_WRITE, target_sd, target_addr, 0))
         return -TARGET_EFAULT;
-    if (host_to_target_ipc_perm(target_addr, &(host_sd->shm_perm)))
+    if (host_to_target_ipc_perm(target_addr, &(host_sd->shm_perm))) {
+        unlock_user_struct(target_sd, target_addr, 0);
         return -TARGET_EFAULT;
+    }
     __put_user(host_sd->shm_segsz, &target_sd->shm_segsz);
     __put_user(host_sd->shm_atime, &target_sd->shm_atime);
     __put_user(host_sd->shm_dtime, &target_sd->shm_dtime);
-- 
1.9.3


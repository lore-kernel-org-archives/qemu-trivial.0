Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tg8xU-0000sH-NU
	for mharc-qemu-trivial@gnu.org; Wed, 05 Dec 2012 01:59:52 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mohan@in.ibm.com>) id 1Tg8xS-0000s6-9m
	for qemu-trivial@nongnu.org; Wed, 05 Dec 2012 01:59:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mohan@in.ibm.com>) id 1Tg8xQ-0004Pt-VZ
	for qemu-trivial@nongnu.org; Wed, 05 Dec 2012 01:59:50 -0500
Received: from e23smtp08.au.ibm.com ([202.81.31.141]:58225)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mohan@in.ibm.com>) id 1Tg8xQ-0004P3-E4
	for qemu-trivial@nongnu.org; Wed, 05 Dec 2012 01:59:48 -0500
Received: from /spool/local
	by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mohan@in.ibm.com>;
	Wed, 5 Dec 2012 16:58:34 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
	by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 5 Dec 2012 16:58:31 +1000
Received: from d23relay05.au.ibm.com (d23relay05.au.ibm.com [9.190.235.152])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id 4B2D22BB004A;
	Wed,  5 Dec 2012 17:59:40 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
	by d23relay05.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	qB56mgJE46792886; Wed, 5 Dec 2012 17:48:43 +1100
Received: from d23av01.au.ibm.com (loopback [127.0.0.1])
	by d23av01.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	qB56xcfb029674; Wed, 5 Dec 2012 17:59:39 +1100
Received: from explorer.ibm.com ([9.78.196.138])
	by d23av01.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	qB56xWdm029538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Wed, 5 Dec 2012 17:59:35 +1100
From: "M. Mohan Kumar" <mohan@in.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87y5hdejes.fsf@linux.vnet.ibm.com>
References: <1349868762-10021-1-git-send-email-pbonzini@redhat.com>
	<50759EEC.8070308@weilnetz.de> <50759F9E.3060800@redhat.com>
	<5075A0FF.3080904@weilnetz.de> <5075A420.10003@redhat.com>
	<5075A843.8020107@weilnetz.de> <5075A966.3090708@weilnetz.de>
	<871uh5tqr7.fsf@explorer.in.ibm.com> <5076BACC.7030309@redhat.com>
	<87y5hdejes.fsf@linux.vnet.ibm.com>
User-Agent: Notmuch/0.13.2 (http://notmuchmail.org) Emacs/24.1.1
	(x86_64-redhat-linux-gnu)
Date: Wed, 05 Dec 2012 12:29:31 +0530
Message-ID: <87sj7lyofg.fsf@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 12120506-5140-0000-0000-00000277A803
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 202.81.31.141
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
X-List-Received-Date: Wed, 05 Dec 2012 06:59:51 -0000

"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com> writes:

> I found this to be confusing. How about avoiding all those pointers, something
> like below ? If you are ok can I add the signed-off-by for this ? I can
> test this and get a pull request out with the build fix.
>
> commit 24cc9f0d07c2a505bfafbdcb72006f2eda1288a4
> Author: Paolo Bonzini <pbonini@redhat.com>
> Date:   Thu Oct 11 14:20:23 2012 +0200
>
>     virtfs-proxy-helper: use setresuid and setresgid
>     
>     The setfsuid and setfsgid system calls are obscure and they complicate
>     the error checking (that glibc's warn_unused_result "feature" forces
>     us to do).  Switch to the standard setresuid and setresgid functions.
>
> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
> index f9a8270..49ab0eb 100644
> --- a/fsdev/virtfs-proxy-helper.c
> +++ b/fsdev/virtfs-proxy-helper.c
> @@ -272,31 +272,59 @@ static int send_status(int sockfd, struct iovec *iovec, int status)
>  /*
>   * from man 7 capabilities, section
>   * Effect of User ID Changes on Capabilities:
> - * 4. If the file system user ID is changed from 0 to nonzero (see setfsuid(2))
> - * then the following capabilities are cleared from the effective set:
> - * CAP_CHOWN, CAP_DAC_OVERRIDE, CAP_DAC_READ_SEARCH,  CAP_FOWNER, CAP_FSETID,
> - * CAP_LINUX_IMMUTABLE  (since  Linux 2.2.30), CAP_MAC_OVERRIDE, and CAP_MKNOD
> - * (since Linux 2.2.30). If the file system UID is changed from nonzero to 0,
> - * then any of these capabilities that are enabled in the permitted set
> - * are enabled in the effective set.
> + * If the effective user ID is changed from nonzero to 0, then the permitted
> + * set is copied to the effective set.  If the effective user ID is changed
> + * from 0 to nonzero, then all capabilities are are cleared from the effective
> + * set.
> + *
> + * The setfsuid/setfsgid man pages warn that changing the effective user ID may
> + * expose the program to unwanted signals, but this is not true anymore: for an
> + * unprivileged (without CAP_KILL) program to send a signal, the real or
> + * effective user ID of the sending process must equal the real or saved user
> + * ID of the target process.  Even when dropping privileges, it is enough to
> + * keep the saved UID to a "privileged" value and virtfs-proxy-helper won't
> + * be exposed to signals.  So just use setresuid/setresgid.
>   */
> -static int setfsugid(int uid, int gid)
> +static int setugid(int uid, int gid, int suid, int sgid)
>  {
> +    int retval;
> +
>      /*
> -     * We still need DAC_OVERRIDE because  we don't change
> +     * We still need DAC_OVERRIDE because we don't change
>       * supplementary group ids, and hence may be subjected DAC rules
>       */
>      cap_value_t cap_list[] = {
>          CAP_DAC_OVERRIDE,
>      };
>
> -    setfsgid(gid);
> -    setfsuid(uid);
> +    if (setresuid(-1, uid, suid) == -1) {
> +        retval = -errno;
> +        goto err_out;
> +    }
> +    if (setresgid(-1, gid, sgid) == -1) {
> +        retval = -errno;
> +        goto err_suid;
> +    }
>

After changing the order of setresuid and setresgid this patch works as
expected. Please move setresgid before setresuid.

Tested-by: M. Mohan Kumar <mohan@in.ibm.com>



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYVrn-0003wl-Hk
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jul 2017 07:13:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dYVrl-0003vy-P7
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 07:13:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dYVrk-0006PX-Nw
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 07:13:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34006)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dYVrg-0006LQ-4I; Fri, 21 Jul 2017 07:13:00 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA9FAC001CFF;
	Fri, 21 Jul 2017 11:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CA9FAC001CFF
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com CA9FAC001CFF
Received: from [10.33.200.180] (dhcp-200-180.str.redhat.com [10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A70C617F34;
	Fri, 21 Jul 2017 11:12:57 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org, Juan Quintela <quintela@redhat.com>
References: <1500395194-21455-1-git-send-email-peter.maydell@linaro.org>
	<1500395194-21455-4-git-send-email-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5de01cad-5a63-ff42-8c6f-25210aa8348d@redhat.com>
Date: Fri, 21 Jul 2017 13:12:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1500395194-21455-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 21 Jul 2017 11:12:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.10 3/4]
 bsd-user/bsdload.c: Remove write-only id_change variable
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Jul 2017 11:13:06 -0000

On 18.07.2017 18:26, Peter Maydell wrote:
> On OpenBSD the compiler complains:
> bsd-user/bsdload.c:54:17: warning: variable 'id_change' set but not used [-Wunused-but-set-variable]
> 
> This is dead code that was originally copied from linux-user.
> We fixed this in linux-user in commit 331c23b5ca44293d1 in 2011;
> delete the useless code from bsd-user too.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  bsd-user/bsdload.c | 25 +------------------------
>  1 file changed, 1 insertion(+), 24 deletions(-)
> 
> diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
> index 94eec36..f38c4fa 100644
> --- a/bsd-user/bsdload.c
> +++ b/bsd-user/bsdload.c
> @@ -20,22 +20,6 @@ abi_long memcpy_to_target(abi_ulong dest, const void *src,
>      return 0;
>  }
>  
> -static int in_group_p(gid_t g)
> -{
> -    /* return TRUE if we're in the specified group, FALSE otherwise */
> -    int         ngroup;
> -    int         i;
> -    gid_t       grouplist[TARGET_NGROUPS];
> -
> -    ngroup = getgroups(TARGET_NGROUPS, grouplist);
> -    for(i = 0; i < ngroup; i++) {
> -        if(grouplist[i] == g) {
> -            return 1;
> -        }
> -    }
> -    return 0;
> -}
> -
>  static int count(char ** vec)
>  {
>      int         i;
> @@ -51,7 +35,7 @@ static int prepare_binprm(struct linux_binprm *bprm)
>  {
>      struct stat         st;
>      int mode;
> -    int retval, id_change;
> +    int retval;
>  
>      if(fstat(bprm->fd, &st) < 0) {
>          return(-errno);
> @@ -67,14 +51,10 @@ static int prepare_binprm(struct linux_binprm *bprm)
>  
>      bprm->e_uid = geteuid();
>      bprm->e_gid = getegid();
> -    id_change = 0;
>  
>      /* Set-uid? */
>      if(mode & S_ISUID) {
>          bprm->e_uid = st.st_uid;
> -        if(bprm->e_uid != geteuid()) {
> -            id_change = 1;
> -        }
>      }
>  
>      /* Set-gid? */
> @@ -85,9 +65,6 @@ static int prepare_binprm(struct linux_binprm *bprm)
>       */
>      if ((mode & (S_ISGID | S_IXGRP)) == (S_ISGID | S_IXGRP)) {
>          bprm->e_gid = st.st_gid;
> -        if (!in_group_p(bprm->e_gid)) {
> -                id_change = 1;
> -        }
>      }
>  
>      memset(bprm->buf, 0, sizeof(bprm->buf));

Matches the commit from linux-user, and looks sane to me, so:

Reviewed-by: Thomas Huth <thuth@redhat.com>


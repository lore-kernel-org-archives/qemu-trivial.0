Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XqJrt-0006ZP-0H
	for mharc-qemu-trivial@gnu.org; Mon, 17 Nov 2014 05:49:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1XqJrn-0006Px-55
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 05:49:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1XqJri-0004Jr-CJ
	for qemu-trivial@nongnu.org; Mon, 17 Nov 2014 05:49:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52731)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1XqJri-0004Jf-5m; Mon, 17 Nov 2014 05:49:02 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAHAmtkg005548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 17 Nov 2014 05:48:55 -0500
Received: from [10.36.112.46] (ovpn-112-46.ams2.redhat.com [10.36.112.46])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAHAmntU017070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Mon, 17 Nov 2014 05:48:51 -0500
Message-ID: <5469D290.5080202@redhat.com>
Date: Mon, 17 Nov 2014 11:48:48 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
	<1416046008-7880-7-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1416046008-7880-7-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, weidong.huang@huawei.com,
	peter.huangpeng@huawei.com, zhang.zhanghailiang@huawei.com
Subject: Re: [Qemu-trivial] [PATCH 6/9] acl: fix memory leak
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
X-List-Received-Date: Mon, 17 Nov 2014 10:49:12 -0000



On 15/11/2014 11:06, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> If 'i != index' for all acl->entries, variable
> entry leaks the storage it points to.
> 
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  util/acl.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/util/acl.c b/util/acl.c
> index 938b7ae..571d686 100644
> --- a/util/acl.c
> +++ b/util/acl.c
> @@ -132,7 +132,6 @@ int qemu_acl_insert(qemu_acl *acl,
>                      const char *match,
>                      int index)
>  {
> -    qemu_acl_entry *entry;
>      qemu_acl_entry *tmp;
>      int i = 0;
>  
> @@ -142,13 +141,14 @@ int qemu_acl_insert(qemu_acl *acl,
>          return qemu_acl_append(acl, deny, match);
>      }
>  
> -    entry = g_malloc(sizeof(*entry));
> -    entry->match = g_strdup(match);
> -    entry->deny = deny;
> -
>      QTAILQ_FOREACH(tmp, &acl->entries, next) {
>          i++;
>          if (i == index) {
> +            qemu_acl_entry *entry;
> +            entry = g_malloc(sizeof(*entry));
> +            entry->match = g_strdup(match);
> +            entry->deny = deny;
> +
>              QTAILQ_INSERT_BEFORE(tmp, entry, next);
>              acl->nentries++;
>              break;
> 

This should never happen, but the patch doesn't hurt either.

Paolo


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzMDi-00030F-9i
	for mharc-qemu-trivial@gnu.org; Thu, 28 Feb 2019 08:59:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gzMDf-0002yn-Ra
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 08:59:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gzMDa-0004Qg-39
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 08:59:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33828)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gzMDR-0004OH-Sg; Thu, 28 Feb 2019 08:59:14 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0539330F279D;
	Thu, 28 Feb 2019 13:59:13 +0000 (UTC)
Received: from [10.3.116.222] (ovpn-116-222.phx2.redhat.com [10.3.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 847EA5D70D;
	Thu, 28 Feb 2019 13:59:08 +0000 (UTC)
To: Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@gmail.com>,
	Julia Suvorova <jusual@mail.ru>
References: <4817f5c3b20aedba869608c06e76d11a722f4864.camel@gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <3aaecc9d-d03b-a754-0ef0-a65609777b2e@redhat.com>
Date: Thu, 28 Feb 2019 07:59:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <4817f5c3b20aedba869608c06e76d11a722f4864.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 28 Feb 2019 13:59:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] trivial malloc to g_malloc
 in thunk
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
X-List-Received-Date: Thu, 28 Feb 2019 13:59:28 -0000

On 2/28/19 7:42 AM, Aarushi Mehta wrote:
> Hi
> 
> This is a trivial contribution part of the BiteSizedTasks on the wiki.
> I found this discussion http://git.corpit.ru/?p=qemu.git;a=commit;h=b45c03f585ea9bb1af76c73e82195418c294919d
> on migrating even g_malloc to g_new, is this not appropriate for the same? 
> The wiki can presumably use an update regarding this.
> 
> Signed-off-by: Aarushi <mehta.aaru20@gmail.com>
> ---
>  thunk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/thunk.c b/thunk.c
> index d5d8645cd4..03fb2abab7 100644
> --- a/thunk.c
> +++ b/thunk.c
> @@ -89,7 +89,7 @@ void thunk_register_struct(int id, const char *name, const argtype *types)
>      for(i = 0;i < 2; i++) {
>          offset = 0;
>          max_align = 1;
> -        se->field_offsets[i] = malloc(nb_fields * sizeof(int));
> +        se->field_offsets[i] = g_malloc(nb_fields * sizeof(int));

Where is the counterpart free() that needs to be changed to g_free()?

Also, you absolutely want g_new() or some other variant that separates
the number of elements from the size of the element as two separate
arguments, to avoid the possibility of integer overflow when using * in
a single argument.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


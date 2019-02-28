Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzM5a-00084G-V8
	for mharc-qemu-trivial@gnu.org; Thu, 28 Feb 2019 08:51:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39743)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gzM5Y-00082s-SS
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 08:51:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gzM5W-000154-FQ
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 08:51:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:11200)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1gzM5T-00013I-7S; Thu, 28 Feb 2019 08:50:59 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 454F1315B661;
	Thu, 28 Feb 2019 13:50:58 +0000 (UTC)
Received: from redhat.com (unknown [10.42.17.75])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FA4418012;
	Thu, 28 Feb 2019 13:50:56 +0000 (UTC)
Date: Thu, 28 Feb 2019 13:50:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Aarushi Mehta <mehta.aaru20@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Stefan Hajnoczi <stefanha@gmail.com>, Julia Suvorova <jusual@mail.ru>
Message-ID: <20190228135054.GE9217@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <4817f5c3b20aedba869608c06e76d11a722f4864.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4817f5c3b20aedba869608c06e76d11a722f4864.camel@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 28 Feb 2019 13:50:58 +0000 (UTC)
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
X-List-Received-Date: Thu, 28 Feb 2019 13:51:05 -0000

On Thu, Feb 28, 2019 at 07:12:45PM +0530, Aarushi Mehta wrote:
> Hi
> 
> This is a trivial contribution part of the BiteSizedTasks on the wiki.
> I found this discussion http://git.corpit.ru/?p=qemu.git;a=commit;h=b45c03f585ea9bb1af76c73e82195418c294919d
> on migrating even g_malloc to g_new, is this not appropriate for the same? 
> The wiki can presumably use an update regarding this.

This kind of question should not be in the commit message - it shoudl
go below the '---'

> 
> Signed-off-by: Aarushi <mehta.aaru20@gmail.com>
> ---

....here....

This lets people answer the question, without the question becoming
part of the git history.

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

Yes, this should use g_new0

>          type_ptr = se->field_types;
>          for(j = 0;j < nb_fields; j++) {
>              size = thunk_type_size(type_ptr, i);
> -- 
> 2.17.1
> 
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


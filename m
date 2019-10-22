Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iMnUs-0001W1-Gm
	for mharc-qemu-trivial@gnu.org; Tue, 22 Oct 2019 02:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60759)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iMnUp-0001U3-Ci
 for qemu-trivial@nongnu.org; Tue, 22 Oct 2019 02:18:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iMnUo-0006g1-5p
 for qemu-trivial@nongnu.org; Tue, 22 Oct 2019 02:18:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41075
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iMnUo-0006fu-2b
 for qemu-trivial@nongnu.org; Tue, 22 Oct 2019 02:18:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571725097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y9t4ZYoitCThfCu83qRbjYr4evCXjg2uqwFMRmx+seY=;
 b=axm+cYF562cclVN7jjtC0LgY2Parq8itO5Pfrx+AzjYf+xFCjhecjMtyaq60sUCUR0HTfs
 oXwtlpm/VcnvRvSVFFSWo9JPltJyEPs/6Kq2v9aFj39mGHqhrljtElDcrEf+2Opbot6Z3V
 7tksxh9qM+m9bVxZ+j5F3ds920V1X7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-vYKR9QsGPia8jk2di8H2IA-1; Tue, 22 Oct 2019 02:18:13 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3848107AD31;
 Tue, 22 Oct 2019 06:18:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABF921001E75;
 Tue, 22 Oct 2019 06:18:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 110461138619; Tue, 22 Oct 2019 08:18:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Han Han <hhan@redhat.com>
Cc: qemu-devel@nongnu.org,  philmd@redhat.com, qemu-trivial@nongnu.org
Subject: Re: [PATCH] qemu-options.hx: Update for reboot-timeout parameter
References: <20191015151451.727323-1-hhan@redhat.com>
Date: Tue, 22 Oct 2019 08:18:08 +0200
In-Reply-To: <20191015151451.727323-1-hhan@redhat.com> (Han Han's message of
 "Tue, 15 Oct 2019 23:14:51 +0800")
Message-ID: <87d0epqp5r.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: vYKR9QsGPia8jk2di8H2IA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Oct 2019 06:18:20 -0000

Han Han <hhan@redhat.com> writes:

> Since ee5d0f89d, -1 is not valid for the value of reboot-timeout. Update
> that in qemu-options doc.
>
> Signed-off-by: Han Han <hhan@redhat.com>
> ---
>  qemu-options.hx | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 793d70ff..6b92a916 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -327,8 +327,8 @@ format(true color). The resolution should be supporte=
d by the SVGA mode, so
   A splash picture could be passed to bios, enabling user to show it as lo=
go,
   when option splash=3D@var{sp_name} is given and menu=3Don, If firmware/B=
IOS
   supports them. Currently Seabios for X86 system support it.
   limitation: The splash file could be a jpeg file or a BMP file in 24 BPP
   format(true color). The resolution should be supported by the SVGA mode,=
 so
>  the recommended is 320x240, 640x480, 800x640.
> =20
>  A timeout could be passed to bios, guest will pause for @var{rb_timeout}=
 ms
> -when boot failed, then reboot. If @var{rb_timeout} is '-1', guest will n=
ot
> -reboot, qemu passes '-1' to bios by default. Currently Seabios for X86
> +when boot failed, then reboot. If @option{reboot-timeout} is not set,
> +guest will not reboot by default. Currently Seabios for X86
>  system support it.
> =20
>  Do strict boot via @option{strict=3Don} as far as firmware/BIOS

Preexisting: "could be passed" sounds awkward.  Same in the previous
paragraph.  Not this patch's problem, so:

Reviewed-by: Markus Armbruster <armbru@redhat.com>



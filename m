Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eEKTp-0002sT-WE
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 14:33:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1eEKTn-0002qF-OV
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 14:33:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1eEKTm-0003WL-Mn
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 14:33:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59558)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1eEKTg-0003So-Ac; Mon, 13 Nov 2017 14:33:04 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 89D6D7653F;
	Mon, 13 Nov 2017 19:33:02 +0000 (UTC)
Received: from [10.18.17.35] (dhcp-17-35.bos.redhat.com [10.18.17.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E757B7F6A9;
	Mon, 13 Nov 2017 19:33:01 +0000 (UTC)
To: Vicente Jimenez Aguilar <googuy@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20171113182752.8223-1-googuy@gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <d22ec102-065f-5570-52f8-f848e5f71640@redhat.com>
Date: Mon, 13 Nov 2017 14:33:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171113182752.8223-1-googuy@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 13 Nov 2017 19:33:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Document mon's pretty
 parameter
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
X-List-Received-Date: Mon, 13 Nov 2017 19:33:12 -0000

Vicente,

Thanks for helping to improve our documentation.

On 11/13/2017 01:27 PM, Vicente Jimenez Aguilar wrote:
> ---

This patch is missing a signed-off-by line, which we require for
contributions to the project. If you'd like, you can reply to your patch
email to add said line if further edits to the patch aren't required.

[See https://wiki.qemu.org/Contribute/SubmitAPatch; this page is very
long, so here's the relevant excerpt: "You must provide a Signed-off-by:
line (this is a hard requirement because it's how you say "I'm legally
okay to contribute this and happy for it to go into QEMU", modeled after
the Linux kernel policy.) git commit -s or git format-patch -s will add
one."]

Every patch also needs a commit message of some kind, something akin to:

"Documentation: document pretty parameter for mon option"

>  qemu-options.hx | 7 ++++--->  1 file changed, 4 insertions(+), 3 deletions(-)> > diff --git
a/qemu-options.hx b/qemu-options.hx> index 3728e9b4dd..f06002689d
100644> --- a/qemu-options.hx> +++ b/qemu-options.hx> @@ -3477,11
+3477,12 @@ Like -qmp but uses pretty JSON formatting.>  ETEXI>  >
DEF("mon", HAS_ARG, QEMU_OPTION_mon, \> -    "-mon
[chardev=]name[,mode=readline|control]\n", QEMU_ARCH_ALL)> +    "-mon
[chardev=]name[,mode=readline|control][,pretty[=on|off]]\n",
QEMU_ARCH_ALL)>  STEXI> -@item -mon
[chardev=]name[,mode=readline|control]> +@item -mon
[chardev=]name[,mode=readline|control][,pretty[=on|off]]>  @findex -mon>
-Setup monitor on chardev @var{name}.> +Setup monitor on chardev
@var{name}. @code{pretty} turn on JSON pretty printing> +easing human
reading and debugging.>  ETEXI>  >  DEF("debugcon", HAS_ARG,
QEMU_OPTION_debugcon, \>
I'm not sure if any other changes are needed or not; it looks OK to me
based on vl.c:2522 where the option is added at runtime.

Thanks,
John


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ep90O-00048e-Nt
	for mharc-qemu-trivial@gnu.org; Fri, 23 Feb 2018 03:47:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ep90M-00046a-JM
	for qemu-trivial@nongnu.org; Fri, 23 Feb 2018 03:46:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ep90L-0001HC-U0
	for qemu-trivial@nongnu.org; Fri, 23 Feb 2018 03:46:58 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53936 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ep90F-00018T-To; Fri, 23 Feb 2018 03:46:51 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50F008182D06;
	Fri, 23 Feb 2018 08:46:42 +0000 (UTC)
Received: from [10.36.116.144] (ovpn-116-144.ams2.redhat.com [10.36.116.144])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16644B3007;
	Fri, 23 Feb 2018 08:46:32 +0000 (UTC)
To: Su Hang <suhang16@mails.ucas.ac.cn>, stefanha@redhat.com
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1519372267-20513-1-git-send-email-suhang16@mails.ucas.ac.cn>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c030a20b-cb16-5c76-9661-9266aee3cca0@redhat.com>
Date: Fri, 23 Feb 2018 09:46:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519372267-20513-1-git-send-email-suhang16@mails.ucas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 23 Feb 2018 08:46:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 23 Feb 2018 08:46:42 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 1/3] util/uri.c: replace
 TAB with whitespace
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
X-List-Received-Date: Fri, 23 Feb 2018 08:46:59 -0000

 Hi,

thanks for splitting your patch in more reviewable parts :-)

Meta-comment: If you send a patch series, please include a cover letter
next time ("PATCH 0/3") with a brief summary. Then the patch series
shows up nicely as a thread in the e-mail programs of the reviewers (you
also got to send out all files at once with "git send-email 000*" for thi=
s).

On 23.02.2018 08:51, Su Hang wrote:
> Formating with clang-format. Change back few code by hand,
> to make sure only include whitespace change.

To make the review really really easy, it would be great if the patch
would not show any differences when displayed with "git diff -w" ... but
that's currently not yet the case since you still changed the position
of newlines in a couple of places, e.g.:

> -    while (ISA_UNRESERVED(cur) || ISA_PCT_ENCODED(cur) ||
> -           ISA_SUB_DELIM(cur) || (*cur =3D=3D ':'))
> -	NEXT(cur);
> +    while (ISA_UNRESERVED(cur) || ISA_PCT_ENCODED(cur) || ISA_SUB_DELI=
M(cur) ||
> +           (*cur =3D=3D ':'))
> +        NEXT(cur);

Anyway, I've went through the diff with "-w" and the changes look
reasonable to me, so I'm also OK if you want to keep the patch as it is:

Reviewed-by: Thomas Huth <thuth@redhat.com>


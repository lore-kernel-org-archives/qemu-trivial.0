Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ep91A-0004XL-6n
	for mharc-qemu-trivial@gnu.org; Fri, 23 Feb 2018 03:47:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ep915-0004Vq-Hu
	for qemu-trivial@nongnu.org; Fri, 23 Feb 2018 03:47:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ep914-0001xS-Pw
	for qemu-trivial@nongnu.org; Fri, 23 Feb 2018 03:47:43 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40002 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ep911-0001vu-Rb; Fri, 23 Feb 2018 03:47:39 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40284406F970;
	Fri, 23 Feb 2018 08:47:39 +0000 (UTC)
Received: from [10.36.116.144] (ovpn-116-144.ams2.redhat.com [10.36.116.144])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C4B710A971D;
	Fri, 23 Feb 2018 08:47:36 +0000 (UTC)
To: Su Hang <suhang16@mails.ucas.ac.cn>, stefanha@redhat.com
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1519372278-20644-1-git-send-email-suhang16@mails.ucas.ac.cn>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c3078a4e-24f4-cc37-ca7f-9f40213639bb@redhat.com>
Date: Fri, 23 Feb 2018 09:47:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519372278-20644-1-git-send-email-suhang16@mails.ucas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 23 Feb 2018 08:47:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 23 Feb 2018 08:47:39 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 2/3] util/uri.c: only
 remove `return`'s brackets
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
X-List-Received-Date: Fri, 23 Feb 2018 08:47:44 -0000

On 23.02.2018 08:51, Su Hang wrote:
> only remove brackets that wrap `return` statements' content.
> 
> use `perl -pi -e "s/return \((.*?)\);/return \1;/g" util/uri.c`
> to remove pattern like this: "return (1);"
> 
> Signed-off-by: Su Hang <suhang16@mails.ucas.ac.cn>
> ---
>  util/uri.c | 160 ++++++++++++++++++++++++++++++-------------------------------
>  1 file changed, 80 insertions(+), 80 deletions(-)

Looks good to me:

Reviewed-by: Thomas Huth <thuth@redhat.com>


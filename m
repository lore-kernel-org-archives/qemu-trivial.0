Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjqoD-0006gk-9p
	for mharc-qemu-trivial@gnu.org; Fri, 03 Mar 2017 12:16:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1cjqoB-0006fb-Ll
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 12:16:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1cjqoA-00030R-RI
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 12:15:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50940)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1cjqo4-0002wh-Du; Fri, 03 Mar 2017 12:15:52 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CDD832E6075;
	Fri,  3 Mar 2017 17:15:51 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-221.bos.redhat.com
	[10.18.17.221])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v23HFoxL021854; Fri, 3 Mar 2017 12:15:51 -0500
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <20170302122429.7737-1-berrange@redhat.com>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <194be75d-52ae-757f-2dbb-f8f4597cec67@redhat.com>
Date: Fri, 3 Mar 2017 12:15:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170302122429.7737-1-berrange@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 03 Mar 2017 17:15:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qmp: allow setting
 properties to empty string in qmp-shell
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
X-List-Received-Date: Fri, 03 Mar 2017 17:16:00 -0000



On 03/02/2017 07:24 AM, Daniel P. Berrange wrote:
> The qmp-shell property parser currently rejects attempts to
> set string properties to the empty string eg
> 
>   (QEMU) migrate-set-parameters  tls-hostname=
>   Error while parsing command line: Expected a key=value pair, got 'tls-hostname='
> command format: <command-name>  [arg-name1=arg1] ... [arg-nameN=argN]
> 
> This is caused by checking the wrong condition after splitting
> the parameter on '='. The "partition" method will return "" for
> the separator field, if the seperator was not present, so that
> is the correct thing to check for malformed syntax.
> 

Ah, good point.

> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
>  scripts/qmp/qmp-shell | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
> index 0373b24..eccb88a 100755
> --- a/scripts/qmp/qmp-shell
> +++ b/scripts/qmp/qmp-shell
> @@ -166,8 +166,8 @@ class QMPShell(qmp.QEMUMonitorProtocol):
>  
>      def __cli_expr(self, tokens, parent):
>          for arg in tokens:
> -            (key, _, val) = arg.partition('=')
> -            if not val:
> +            (key, sep, val) = arg.partition('=')
> +            if sep != '=':
>                  raise QMPShellError("Expected a key=value pair, got '%s'" % arg)
>  
>              value = self.__parse_value(val)
> 


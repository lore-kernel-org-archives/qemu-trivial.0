Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPS7W-0007DN-Oq
	for mharc-qemu-trivial@gnu.org; Sat, 30 Jan 2016 04:47:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aPS7U-00079m-Dk
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 04:47:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aPS7T-0003W5-IQ
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 04:47:04 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48931)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aPS7P-0003Vp-89; Sat, 30 Jan 2016 04:46:59 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A7F5F41CA2;
	Sat, 30 Jan 2016 12:46:58 +0300 (MSK)
To: Wei Yang <richard.weiyang@gmail.com>, qemu-trivial@nongnu.org
References: <1453644598-11250-1-git-send-email-richard.weiyang@gmail.com>
	<1453644598-11250-2-git-send-email-richard.weiyang@gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56AC8692.3010403@msgid.tls.msk.ru>
Date: Sat, 30 Jan 2016 12:46:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1453644598-11250-2-git-send-email-richard.weiyang@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: amit.shah@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
	quintela@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 2/2] qmp-spec: fix index in doc
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
X-List-Received-Date: Sat, 30 Jan 2016 09:47:05 -0000

24.01.2016 17:09, Wei Yang wrote:
> The index is duplicated. Just change it.

It is indeed, with previous being 2.5 as well
and the next being 3. Applying to -trivial.

Please the next time send to qemu-devel@ and Cc to -trivial.

Thanks!

/mjt

> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
> ---
>  docs/qmp-spec.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/qmp-spec.txt b/docs/qmp-spec.txt
> index 4fb10a5..8e4bc3d 100644
> --- a/docs/qmp-spec.txt
> +++ b/docs/qmp-spec.txt
> @@ -180,7 +180,7 @@ Some events are rate-limited to at most one per second.  If additional
>  dropped, and the last one is delayed.  "Similar" normally means same
>  event type.  See qmp-events.txt for details.
>  
> -2.5 QGA Synchronization
> +2.6 QGA Synchronization
>  -----------------------
>  
>  When using QGA, an additional synchronization feature is built into
> 



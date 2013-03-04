Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UCSzi-0002ix-Ij
	for mharc-qemu-trivial@gnu.org; Mon, 04 Mar 2013 05:51:46 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UCSzf-0002eR-GY
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2013 05:51:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UCSze-00023g-Jg
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2013 05:51:43 -0500
Received: from mail-bk0-f53.google.com ([209.85.214.53]:50422)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UCSzb-00022s-SB; Mon, 04 Mar 2013 05:51:40 -0500
Received: by mail-bk0-f53.google.com with SMTP id j10so2354911bkw.12
	for <multiple recipients>; Mon, 04 Mar 2013 02:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Qh43fKUBltpnPYsFKZR1ghW/wNPHlrZAoy9ZCR6CIP8=;
	b=ogZHm5hc02nC1rVCQavClRih78LF6HZGMXorxqpfRHTUfsTRp5X5DPRw8sktkpemXv
	f9WijLAl0d5F16D5x67ZKv8fneldld2OgoWK/7EWid03YUcN2QJYqQDbYQ16nalUvT4q
	bLn6AJoPJwYkHTj6fDZXzXEU5FVAPyNDVV86Ez535OE5q33ZHHmZk3XCyn3SuVIUEygN
	07YKjg5ybqpRj7AtvuFHRzix3FwAMN1Sx9FxqFlgPVWkObf9RR7VMS4+P4lyoxWWCZ1Q
	pYDcKWBAWkIikND4v/zhcC5whGwVNpihZYrZ+Q8WUG10Hjj71WaY9fN/CLH1YzTFGYts
	rVpw==
X-Received: by 10.204.165.15 with SMTP id g15mr7115722bky.140.1362394298716;
	Mon, 04 Mar 2013 02:51:38 -0800 (PST)
Received: from localhost ([2a02:810d:e80:64:69de:8c87:ab42:42b3])
	by mx.google.com with ESMTPS id z6sm5582994bkv.11.2013.03.04.02.51.37
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 02:51:37 -0800 (PST)
Date: Mon, 4 Mar 2013 11:51:36 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <20130304105136.GA2837@stefanha-thinkpad.redhat.com>
References: <302ae9628718b0c4ae10528ec97e88a6000b6099.1362123798.git.mprivozn@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <302ae9628718b0c4ae10528ec97e88a6000b6099.1362123798.git.mprivozn@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.214.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Require at least
 spice-protocol-0.12.3
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
X-List-Received-Date: Mon, 04 Mar 2013 10:51:44 -0000

On Fri, Mar 01, 2013 at 08:43:18AM +0100, Michal Privoznik wrote:
> As of 5a49d3e9 we assume SPICE_PORT_EVENT_BREAK to be defined.
> However, it is defined not in 0.12.2 what we require now, but in
> 0.12.3.  Therefore in order to prevent build failure we must
> adjust our minimal requirements.
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan


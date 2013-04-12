Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UQcRX-00079K-2N
	for mharc-qemu-trivial@gnu.org; Fri, 12 Apr 2013 07:46:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UQcRT-000743-Td
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:46:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UQcRR-0007bg-Mx
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:46:55 -0400
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231]:62178)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UQcRH-0007YB-Id; Fri, 12 Apr 2013 07:46:43 -0400
Received: by mail-wi0-f177.google.com with SMTP id hm14so1486090wib.10
	for <multiple recipients>; Fri, 12 Apr 2013 04:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=UMuurARTAL8O1IiQMfT4cGs05cQaXPlU/gKTnxNE6O4=;
	b=B0SJz8A/kdxqNhPhvscIjEnvPxG3GmrByraW0FYOgT5NKcoPhfQlpJTIJje8UugqvQ
	VODUB6xNmx1tfRX9FfZkIRIERdYlBLgZR+/yL5iS9x187BIYvOdwP3olhbzYS+vwDNBP
	lDi5LYVELZJrfiQcPfv/9whM2bsQQQ53acStzHLoynO+tm2mLtcVIh8N958sWVEDl5Nh
	9C+wZMs+F3p2G9TJvQwbE+JT6MnRurdLZt+IKUAm7dDIyCyCu1NFGM+Fj1ZTB4johe6B
	hlG2lMCiNKJ5gNnpDqmXVt9bMMLAI8mwusHdXxoMCvjne6O1HhojbAmm1I+yusVr1NFZ
	XBtw==
X-Received: by 10.180.103.65 with SMTP id fu1mr3525465wib.4.1365767202659;
	Fri, 12 Apr 2013 04:46:42 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:495e:8c2d:3047:9ee5])
	by mx.google.com with ESMTPS id er1sm2828740wib.5.2013.04.12.04.46.41
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 04:46:41 -0700 (PDT)
Date: Fri, 12 Apr 2013 13:46:40 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20130412114640.GI9747@stefanha-thinkpad.redhat.com>
References: <1365711706-23960-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1365711706-23960-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::231
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] cpu-exec: Allow "-d exec" in non-debug
 builds (drop CONFIG_DEBUG_EXEC)
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
X-List-Received-Date: Fri, 12 Apr 2013 11:46:57 -0000

On Thu, Apr 11, 2013 at 09:21:46PM +0100, Peter Maydell wrote:
> The CONFIG_DEBUG_EXEC define compiles out a single qemu_log_mask()
> call, which is a pretty trivial cost even for something in the main
> cpu_exec() loop.  Having this be conditionally defined means that
> '-d exec' on a non-debug build will silently do nothing.  Drop the
> define and the configure machinery that sets it, in favour of just
> always allowing this log option to be enabled at runtime.  As a
> concession to the mainloopiness, we use qemu_loglevel_mask()+qemu_log()
> rather than qemu_log_mask() to avoid the function call overhead.
> 
> Note that DEBUG_DISAS is always defined, so removing the
> '|| defined(CONFIG_DEBUG_EXEC)' from those conditionals makes
> no behavioural change for that logging.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I've been burnt at least once by asking a user to do a '-d exec'
> log only to find it didn't actually log anything...
> 
>  configure  |  3 ---
>  cpu-exec.c | 15 ++++++---------
>  2 files changed, 6 insertions(+), 12 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan


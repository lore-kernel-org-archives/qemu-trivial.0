Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UL9Oa-000888-Rx
	for mharc-qemu-trivial@gnu.org; Thu, 28 Mar 2013 05:45:20 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UL9OW-00087y-RY
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 05:45:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UL9OV-0000jl-D5
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 05:45:16 -0400
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231]:64625)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UL9OV-0000jS-78; Thu, 28 Mar 2013 05:45:15 -0400
Received: by mail-wi0-f177.google.com with SMTP id hm14so3049435wib.10
	for <multiple recipients>; Thu, 28 Mar 2013 02:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=5bdRkPu3WGq2L+p76dzpPaYKHVyqbtXq38smZRF6afg=;
	b=vhHh65Ex5tMoc5zUJMEo22Akgc6VwF3lDURHWItdumLDCc3qZB2wD43p1qBRzTVJkU
	vDf709XDDNAwFxo3EsNf1B8euLR0cmGIyyD3MGNcyCHMIW2z2wEVqnGOxc5lcXT/fzKe
	4WQA9sV1eAOicUH4e2B5MAkI25OOVmmq+UD86gg14wrwgwxF9PVVc250NONGih50UPw6
	6H3V33oc5uifDeht/ys3vuhgimJOz0l4Ba+28bhs242xtoMVAJb4FM5ZUCINa4At+eRz
	JI27Rh2ABaoc5ipLL6Cbg23zhb2sRl4kHzgMlf2zuFknnsvdnmnflFn+ayu5+BI2uinm
	f+1Q==
X-Received: by 10.180.94.39 with SMTP id cz7mr15022312wib.21.1364463914324;
	Thu, 28 Mar 2013 02:45:14 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:60a5:f151:c14b:54e1])
	by mx.google.com with ESMTPS id f1sm14724611wib.0.2013.03.28.02.45.12
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 02:45:13 -0700 (PDT)
Date: Thu, 28 Mar 2013 10:45:11 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Richard Henderson <rth@twiddle.net>
Message-ID: <20130328094511.GF24910@stefanha-thinkpad.redhat.com>
References: <1364410030-24008-1-git-send-email-rth@twiddle.net>
	<515383E2.7010408@suse.de> <51539468.6060301@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51539468.6060301@twiddle.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::231
Cc: qemu-trivial@nongnu.org,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vmxnet: Don't use bswap_64
 for constants
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
X-List-Received-Date: Thu, 28 Mar 2013 09:45:19 -0000

On Wed, Mar 27, 2013 at 05:52:56PM -0700, Richard Henderson wrote:
> On 2013-03-27 16:42, Andreas Färber wrote:
> >Am 27.03.2013 19:47, schrieb Richard Henderson:
> >>This macro is used in the context of defining enum values.
> >>We can't use a function call in that case.
> >>
> >>Cc: qemu-trivial@nongnu.org
> >>Signed-off-by: Richard Henderson <rth@twiddle.net>
> >>---
> >>  hw/vmxnet3.h | 10 +++++++++-
> >>  1 file changed, 9 insertions(+), 1 deletion(-)
> >>
> >>diff --git a/hw/vmxnet3.h b/hw/vmxnet3.h
> >>index 7db0c8f..cd9ac85 100644
> >>--- a/hw/vmxnet3.h
> >>+++ b/hw/vmxnet3.h
> >>@@ -37,7 +37,15 @@
> >>  #define __packed QEMU_PACKED
> >>
> >>  #if defined(HOST_WORDS_BIGENDIAN)
> >>-#define const_cpu_to_le64(x) bswap_64(x)
> >>+#define const_cpu_to_le64(x) \
> >>+        (((x & 0x00000000000000ffULL) << 56) | \
> >>+         ((x & 0x000000000000ff00ULL) << 40) | \
> >>+         ((x & 0x0000000000ff0000ULL) << 24) | \
> >>+         ((x & 0x00000000ff000000ULL) <<  8) | \
> >>+         ((x & 0x000000ff00000000ULL) >>  8) | \
> >>+         ((x & 0x0000ff0000000000ULL) >> 24) | \
> >>+         ((x & 0x00ff000000000000ULL) >> 40) | \
> >>+         ((x & 0xff00000000000000ULL) >> 56))
> >
> >Being a macro, shouldn't this better use (x) for operator precedence?
> 
> It doesn't matter for this usage.
> 
> Nor, according to other threads that appeared on the list today, is this
> the right fix, since the bswap itself turns out to be bogus.

Dmitry said he's sending a fix, will wait for that.

Stefan


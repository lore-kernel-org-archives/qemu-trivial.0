Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UL9AA-0002FC-8O
	for mharc-qemu-trivial@gnu.org; Thu, 28 Mar 2013 05:30:26 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UL9A4-00027O-Bd
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 05:30:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UL9A3-0004Qk-0p
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 05:30:20 -0400
Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229]:56005)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UL99y-0004Pv-Rb; Thu, 28 Mar 2013 05:30:14 -0400
Received: by mail-wg0-f41.google.com with SMTP id y10so1310136wgg.4
	for <multiple recipients>; Thu, 28 Mar 2013 02:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=KUPi0qGjm/e2j5YSCBOCgu2kjdsyMsK0r6xAAwLSiLY=;
	b=tuo7YVaCLHOVabsmAl6bwyRcXizZoKxLRRQg6orzOcAFecdCzWBK74e+6/NuHrd7qq
	lOV3vYUh/dfycSGK/e6qch9dTcYmKM2kYx8dUco9vM5C03WxhI+ssmKh2BdNQIDQx/mp
	ljQbcSjJMhSS4qMDrMTZuwJvYVtoL6mt0jqbpLeTg57tWCtcMShGcx8J9HIlQcmm0bfg
	epBa+WCX2EK5TVNhlN/QF7aJItRJqwbALC68tVbWSSkyjrFYNZEHiDblckKElBgQuLiU
	r/86rAf/B5cr1daxDQ8u4t724BJQyhOdJbHuO7DXob4ZsnYQpB/nA9QMNCIQdoR4m8jo
	XdjA==
X-Received: by 10.194.121.6 with SMTP id lg6mr36740818wjb.22.1364463013982;
	Thu, 28 Mar 2013 02:30:13 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:60a5:f151:c14b:54e1])
	by mx.google.com with ESMTPS id er1sm13086026wib.5.2013.03.28.02.30.12
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 02:30:13 -0700 (PDT)
Date: Thu, 28 Mar 2013 10:30:11 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: liguang <lig.fnst@cn.fujitsu.com>
Message-ID: <20130328093011.GB24910@stefanha-thinkpad.redhat.com>
References: <1364287399-19186-1-git-send-email-lig.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1364287399-19186-1-git-send-email-lig.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::229
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel][PATCH] hw/i386/pc: format
 load_linux function
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
X-List-Received-Date: Thu, 28 Mar 2013 09:30:25 -0000

On Tue, Mar 26, 2013 at 04:43:19PM +0800, liguang wrote:
> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> ---
>  hw/i386/pc.c |  109 ++++++++++++++++++++++++++++++----------------------------
>  1 files changed, 56 insertions(+), 53 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan


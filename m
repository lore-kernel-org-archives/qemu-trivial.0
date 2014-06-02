Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WrREo-0005YR-1d
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jun 2014 08:21:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WrREg-0005Oz-K3
	for qemu-trivial@nongnu.org; Mon, 02 Jun 2014 08:21:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WrREa-0007VI-LO
	for qemu-trivial@nongnu.org; Mon, 02 Jun 2014 08:21:06 -0400
Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234]:64758)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1WrREL-0007SA-2K; Mon, 02 Jun 2014 08:20:45 -0400
Received: by mail-wi0-f180.google.com with SMTP id hi2so4466162wib.13
	for <multiple recipients>; Mon, 02 Jun 2014 05:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Rd56TCwZ0Y2ewDkDQYF8OAY8cZ6I6rnZP5sGsPzPJNE=;
	b=l+KU63ggefqG9Xfe8u3XOMKLAGv9YMNsa6cy1jWDI+7DPhG/7YNGsEQbqO5GpUdogL
	V/UnChv9Z/UbeMvP55FUnqfR0olUvitGFPPGT5ENMk3JeAFeobMIZhfbjHxN4ILCBDSa
	HdVLHOE3ayFhUq7gttExsPGmy4lSaBBnZS+VwfoskM2aqdU6bGP24gxSTrvILSwL0v+g
	qA/YqEBniD9xumeohmy2owBL5bXnyVxiEDXF9FKC2LMhP0eN8lMugopOu7GOFMIknD4M
	1vaGDl/6aT+gg1Rev5WSJjlKlbQF2oFP33123g+mu7DqSe7Ry2Cixq1P4SbHqZ6mLeVV
	F48A==
X-Received: by 10.180.19.233 with SMTP id i9mr22036518wie.38.1401711639523;
	Mon, 02 Jun 2014 05:20:39 -0700 (PDT)
Received: from localhost (95-90-192-172-dynip.superkabel.de. [95.90.192.172])
	by mx.google.com with ESMTPSA id
	m1sm32137939wib.20.2014.06.02.05.20.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jun 2014 05:20:38 -0700 (PDT)
Date: Mon, 2 Jun 2014 14:20:36 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Hani Benhabiles <kroosec@gmail.com>
Message-ID: <20140602122036.GA3049@stefanha-thinkpad.redhat.com>
References: <1401623615-7548-1-git-send-email-kroosec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1401623615-7548-1-git-send-email-kroosec@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::234
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	lcapitulino@redhat.com, stefanha@redhat.com, xiawenc@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] readline: Clear screen on
	form feed.
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
X-List-Received-Date: Mon, 02 Jun 2014 12:21:12 -0000

On Sun, Jun 01, 2014 at 12:53:35PM +0100, Hani Benhabiles wrote:
> Signed-off-by: Hani Benhabiles <hani@linux.com>
> ---
>  util/readline.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Please only CC me on patches for areas of the code that I maintain or
you feel I am an expert in.  That includes block, net, and tracing.
Monitor and terminal escape sequences isn't my forte :-).

Stefan


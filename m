Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UQcEE-0005NL-E2
	for mharc-qemu-trivial@gnu.org; Fri, 12 Apr 2013 07:33:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UQcE8-0005Fb-64
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:33:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UQcE6-0001ba-UN
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 07:33:08 -0400
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a]:49785)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UQcDw-0001Yx-Mz; Fri, 12 Apr 2013 07:32:56 -0400
Received: by mail-wi0-f170.google.com with SMTP id hm11so1541697wib.5
	for <multiple recipients>; Fri, 12 Apr 2013 04:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Q69NW4VopLJYYtaRsoym+o06bAU29BlNv5/UiMfr8SY=;
	b=uSXcoz7Zcg+2gQ7HcAYhDqbO0pfROwN4YfYv9S0gyCan5UD5C1o98G9LTBlD5nJ/3U
	KG6caIMBqmZcb/yhL+gAmReqlQseeAQ6Irs/NZfl0GdL3zf6dPbpMt/9q59IxNMukKI/
	yNNqzpzJLbtj9dCQxEncfDNTZfyWvZyfQESiGPMsdxiWt2Frazc62lJdyV8v70vGK2j8
	qD3CYQZES+PUOfvKNZmia4q9lZD/gCaBE5Gsv8zPBb39ZPv0g/Dl5lwy7fopMq7CwtmR
	0D7E7YpkEiXdGvkxBuBFwgS2Ec6AgWmrQoURqO9IO1+T2xYvo0gEOECPSp/hYqOoP2jr
	XIRw==
X-Received: by 10.194.242.163 with SMTP id wr3mr16794380wjc.35.1365766375797; 
	Fri, 12 Apr 2013 04:32:55 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:495e:8c2d:3047:9ee5])
	by mx.google.com with ESMTPS id bo1sm3128453wib.0.2013.04.12.04.32.53
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 04:32:54 -0700 (PDT)
Date: Fri, 12 Apr 2013 13:32:52 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20130412113252.GC9747@stefanha-thinkpad.redhat.com>
References: <1365436306-20152-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1365436306-20152-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22a
Cc: qemu-trivial@nongnu.org, Anthony Green <green@moxielogic.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] target-moxie: Fix VMState registration
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
X-List-Received-Date: Fri, 12 Apr 2013 11:33:13 -0000

On Mon, Apr 08, 2013 at 04:51:46PM +0100, Peter Maydell wrote:
> Register the CPU VMState in the correct way, via cpu_class_set_vmsd(),
> rather than doing it in two different wrong ways (once by providing
> cpu_save and cpu_load functions, and once by setting the vmsd field in
> DeviceClass).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Having just revamped the target-arm vmstate code I now have a
> better grasp of how it should work, so I noticed we didn't quite
> get moxie right. Not really very tested since I couldn't find a test
> image to try, but should work better than the previous code...
> 
>  target-moxie/cpu.c     |    2 +-
>  target-moxie/cpu.h     |    2 --
>  target-moxie/machine.c |   12 +-----------
>  3 files changed, 2 insertions(+), 14 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan


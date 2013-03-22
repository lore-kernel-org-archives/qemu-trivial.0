Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UJ10y-0008K8-9W
	for mharc-qemu-trivial@gnu.org; Fri, 22 Mar 2013 08:24:08 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UJ10v-0008Fq-2E
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 08:24:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UJ10s-0005NZ-M5
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 08:24:04 -0400
Received: from mail-wi0-x22f.google.com ([2a00:1450:400c:c05::22f]:33158)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UJ10m-0005Lq-7t; Fri, 22 Mar 2013 08:23:56 -0400
Received: by mail-wi0-f175.google.com with SMTP id c10so2377088wiw.2
	for <multiple recipients>; Fri, 22 Mar 2013 05:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=cKUex7RqBfL4WGLNnjzIdzGtdZOkcmwlUuec/4Z3ZpE=;
	b=s/DPSPOZpabc+IqwwZO/LV1mJcgiM/ulORghSU+hpsCfIzp5OksAnXzzAzP20mGWmq
	Vjjzr9u7DFOZjdZLzYYXMoNwXb31xhSUihRilyCAEVBXPGvGI4nDx4i1wrU63tNn1DWk
	yFXswSDN6/X1JtluS2H0TUsc9nDEv/vwhchS7njRvw/LQCB8kn2vvpK/7eAPT06JMCY3
	tFJVt+vKn0qJzp3ZJVlslsjdwDaj3ehM9k33gfnosOooSdy76U2gjZXBmAy2/f1N8dgX
	53JBMQ1fQ7Z0zuvPjdtKovmNkH7DIAKDtUEzWwxUY6QhR3ThJv8zuV2k+rj3fyTjB0qs
	WRGg==
X-Received: by 10.194.157.42 with SMTP id wj10mr2780336wjb.12.1363955035387;
	Fri, 22 Mar 2013 05:23:55 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:81b0:6069:490c:9a88])
	by mx.google.com with ESMTPS id t7sm10561999wij.2.2013.03.22.05.23.54
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 05:23:54 -0700 (PDT)
Date: Fri, 22 Mar 2013 13:23:52 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <20130322122352.GC30604@stefanha-thinkpad.redhat.com>
References: <1363553006-27008-1-git-send-email-cardoe@cardoe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1363553006-27008-1-git-send-email-cardoe@cardoe.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22f
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Advertise --libdir in configure --help
 output
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
X-List-Received-Date: Fri, 22 Mar 2013 12:24:07 -0000

On Sun, Mar 17, 2013 at 03:43:26PM -0500, Doug Goldstein wrote:
> The configure script allows you to supply a libdir via --libdir but was
> not advertising this in --help.
> 
> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
> CC: qemu-trivial@nongnu.org
> ---
>  configure | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UJ0rb-00024G-AD
	for mharc-qemu-trivial@gnu.org; Fri, 22 Mar 2013 08:14:27 -0400
Received: from eggs.gnu.org ([208.118.235.92]:52276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UJ0rV-000248-7X
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 08:14:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UJ0rT-00018i-Qt
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 08:14:21 -0400
Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232]:53528)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UJ0rT-00018W-K8
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 08:14:19 -0400
Received: by mail-wi0-f178.google.com with SMTP id hq4so4234844wib.11
	for <qemu-trivial@nongnu.org>; Fri, 22 Mar 2013 05:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=59sS+DdErch5Wpft+9L4FP+cK4vfUZoDb6Y72b5YfZQ=;
	b=WUdbn/pXZ853NYPuIvj9qD/C/y5gGQNXK/4ke8GbhLuigib5In3+FWya8w5R0RGyTU
	G6/G+QLo0tc4x9BrRDFSh3PVt/jv07/+id4IZFoA01ZRcrLKYGkSLm7mZJsAts7UIBwP
	3ppiMquSK2W1izFxpSvGTjxgkyBmS3xhaqb/HqNRNG2TTMAF6A0N1hsR6B0idVwrKBQW
	hfq0hG417Zw8/Hh4RkB9lQWUdRYjVbnU6yy1TxStQ7yngQZRmMCmgS1n555DcXkOZVpn
	fQB5Fi2xmFWm7KO2P3aoOphimSamaU7NgF3xpqiwY1BcgU9W+2FBVZpgSzjO5vVe/q3m
	7snA==
X-Received: by 10.180.103.40 with SMTP id ft8mr10918909wib.28.1363954458582;
	Fri, 22 Mar 2013 05:14:18 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:81b0:6069:490c:9a88])
	by mx.google.com with ESMTPS id du2sm10530500wib.0.2013.03.22.05.14.16
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 05:14:17 -0700 (PDT)
Date: Fri, 22 Mar 2013 13:14:15 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Guillaume Subiron <maethor@subiron.org>
Message-ID: <20130322121415.GA30604@stefanha-thinkpad.redhat.com>
References: <1362745460-27944-1-git-send-email-maethor@subiron.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1362745460-27944-1-git-send-email-maethor@subiron.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::232
Cc: qemu-trivial@nongnu.org, jan.kiszka@siemens.com, ped@listes.subiron.org
Subject: Re: [Qemu-trivial] [PATCH] slirp: Warn about failing to parse
 /etc/resolv.conf
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
X-List-Received-Date: Fri, 22 Mar 2013 12:14:26 -0000

On Fri, Mar 08, 2013 at 01:24:20PM +0100, Guillaume Subiron wrote:
> Some users may have only a link-local IPv6 in their resolv.conf. In slirp mode, DNS resolution fails with timeout.
> 
> This adds two messages to alert the user that no DNS have been found instead of just exiting without explanation.
> They are kept printed until the user fixes the issue in /etc/resolv.conf.
> 
> Signed-off-by: Guillaume Subiron <maethor@subiron.org>
> ---
>  slirp/slirp.c |    8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/slirp/slirp.c b/slirp/slirp.c
> index 0e6e232..1683639 100644
> --- a/slirp/slirp.c
> +++ b/slirp/slirp.c
> @@ -135,8 +135,10 @@ int get_dns_addr(struct in_addr *pdns_addr)
>      }
>  
>      f = fopen("/etc/resolv.conf", "r");
> -    if (!f)
> +    if (!f) {
> +        fprintf(stderr, "Unable to open /etc/resolv.conf\n");
>          return -1;
> +    }
>  
>  #ifdef DEBUG
>      lprint("IP address of your DNS(s): ");
> @@ -168,8 +170,10 @@ int get_dns_addr(struct in_addr *pdns_addr)
>          }
>      }
>      fclose(f);
> -    if (!found)
> +    if (!found) {
> +        fprintf(stderr, "No IPv4 found in /etc/resolv.conf\n");
>          return -1;
> +    }
>      return 0;
>  }

Please use error_report() like other net backends.  You can drop the
newline for error_report().

Stefan


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvnY9-00021F-EQ
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2013 06:22:25 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TvnY7-0001x6-9I
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 06:22:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TvnY6-0001ws-Cu
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 06:22:23 -0500
Received: from mail-wi0-f179.google.com ([209.85.212.179]:46764)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TvnY3-0001vi-52; Thu, 17 Jan 2013 06:22:19 -0500
Received: by mail-wi0-f179.google.com with SMTP id o1so2184751wic.12
	for <multiple recipients>; Thu, 17 Jan 2013 03:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=QHJS8v0RaXmuHwyKue9szT7zrlYswYg+e27vKQedf1Y=;
	b=kZQ9YY2vzJdZDLSb+VbnalhJDpYFd7qFiQ1ZNJ5UdAL0BmBdaMnHhe/b8shECEXBM2
	qPvPWoLiFEtUvVPs9hBSMlp7Ibxxe1m3hYbA6VXSdPy3PB3w5SYtJfD/D465sYcaoRFF
	nJmKkllvu5utfRHF7I2H7hg6/0TsFDVbdxDNBFjIGvgAWIrD6eVkcTtvUDpy6CAw+IOK
	RQFXFAiw4swl0aUUqhvRTWLx64zoijh2cIFDIOMYYn5uuk0eqrIb7x4T5rIPguOsjkH0
	2/ySV/7GfE/Tdnye/8mZTxt1xQFgII1CFb1QXq/ykyBipA2pC2J80iC0VfBDLyNyT3Bb
	IP8Q==
X-Received: by 10.194.238.226 with SMTP id vn2mr7664103wjc.23.1358421738230;
	Thu, 17 Jan 2013 03:22:18 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id i2sm12471962wiw.3.2013.01.17.03.22.16
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 03:22:17 -0800 (PST)
Date: Thu, 17 Jan 2013 12:22:15 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20130117112215.GI2586@stefanha-thinkpad.redhat.com>
References: <1358357540-29862-1-git-send-email-armbru@redhat.com>
	<1358357540-29862-7-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1358357540-29862-7-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.212.179
Cc: qemu-trivial@nongnu.org, eblake@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2 06/11] virtfs-proxy-helper: Fix
 unchecked strdup() by conv. to g_strdup()
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
X-List-Received-Date: Thu, 17 Jan 2013 11:22:24 -0000

On Wed, Jan 16, 2013 at 06:32:15PM +0100, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  fsdev/virtfs-proxy-helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
> index 6b9afd3..36f6616 100644
> --- a/fsdev/virtfs-proxy-helper.c
> +++ b/fsdev/virtfs-proxy-helper.c
> @@ -1039,7 +1039,7 @@ int main(int argc, char **argv)
>          }
>          switch (c) {
>          case 'p':
> -            rpath = strdup(optarg);
> +            rpath = g_strdup(optarg);
>              break;
>          case 'n':
>              is_daemon = false;
> @@ -1048,7 +1048,7 @@ int main(int argc, char **argv)
>              sock = atoi(optarg);
>              break;
>          case 's':
> -            sock_name = strdup(optarg);
> +            sock_name = g_strdup(optarg);

rpath and sock_name are leaked.  Not important though because they are
in main().

Stefan


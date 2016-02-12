Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aUFaP-0007cr-Jl
	for mharc-qemu-trivial@gnu.org; Fri, 12 Feb 2016 10:24:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aUFaN-0007ZW-4w
	for qemu-trivial@nongnu.org; Fri, 12 Feb 2016 10:24:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aUFaM-0006vm-BU
	for qemu-trivial@nongnu.org; Fri, 12 Feb 2016 10:24:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45973)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1aUFaJ-0006uI-6V; Fri, 12 Feb 2016 10:24:39 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id CB3288E67A;
	Fri, 12 Feb 2016 15:24:38 +0000 (UTC)
Received: from [10.36.112.60] (ovpn-112-60.ams2.redhat.com [10.36.112.60])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1CFOZU3004455
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 12 Feb 2016 10:24:37 -0500
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <1455288410-27046-1-git-send-email-berrange@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56BDF933.6040208@redhat.com>
Date: Fri, 12 Feb 2016 16:24:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <1455288410-27046-1-git-send-email-berrange@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] char: fix handling of
	QIO_CHANNEL_ERR_BLOCK
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
X-List-Received-Date: Fri, 12 Feb 2016 15:24:44 -0000



On 12/02/2016 15:46, Daniel P. Berrange wrote:
> If io_channel_send_full gets QIO_CHANNEL_ERR_BLOCK it
> and has already sent some of the data, it should return
> that amount of data, not EAGAIN, as that would cause
> the caller to re-try already sent data.
> 
> Unfortunately due to a previous rebase conflict resolution
> error, the code for dealing with this was in the wrong
> part of the conditional, and so mistakenly ran on other
> I/O errors.
> 
> This be seen running
> 
>    qemu-system-x86_64 -monitor stdio
> 
> and entering 'info mtree', when running on a slow console
> (eg a slow remote ssh session). The monitor would get into
> an indefinite loop writing the same data until it managed
> to send it all without getting EAGAIN.
> 
> Reported-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>  qemu-char.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/qemu-char.c b/qemu-char.c
> index 1b7d5da..c2e24a5 100644
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -896,13 +896,13 @@ static int io_channel_send_full(QIOChannel *ioc,
>              ioc, &iov, 1,
>              fds, nfds, NULL);
>          if (ret == QIO_CHANNEL_ERR_BLOCK) {
> -            errno = EAGAIN;
> -            return -1;
> -        } else if (ret < 0) {
>              if (offset) {
>                  return offset;
>              }
>  
> +            errno = EAGAIN;
> +            return -1;
> +        } else if (ret < 0) {
>              errno = EINVAL;
>              return -1;
>          }
> 

Queued, thanks.

Paolo


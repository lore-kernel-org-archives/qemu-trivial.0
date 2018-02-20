Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eo4oW-0003NK-RX
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2018 05:06:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eo4oP-0003Hy-JS
	for qemu-trivial@nongnu.org; Tue, 20 Feb 2018 05:06:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1eo4oJ-0004YJ-U6
	for qemu-trivial@nongnu.org; Tue, 20 Feb 2018 05:06:13 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54014 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1eo4oD-0004R3-7T; Tue, 20 Feb 2018 05:06:01 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D3380EB6F0;
	Tue, 20 Feb 2018 10:05:55 +0000 (UTC)
Received: from [10.36.118.42] (unknown [10.36.118.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52B5F10A9DC2;
	Tue, 20 Feb 2018 10:05:50 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Daniel Berrange <berrange@redhat.com>
References: <1519071820-4062-1-git-send-email-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <de1d7a3b-6e8c-2973-1810-4ead57228057@redhat.com>
Date: Tue, 20 Feb 2018 11:05:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519071820-4062-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 20 Feb 2018 10:05:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 20 Feb 2018 10:05:55 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'pbonzini@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH] Remove the deprecated -tdf option
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Feb 2018 10:06:19 -0000

On 19/02/2018 21:23, Thomas Huth wrote:
> It's been marked as deprecated since a very long time already, and
> the parameter is not doing anything useful anymore except for printing
> a warning, so it's now time to finally get rid of this option.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qemu-doc.texi | 7 -------
>  vl.c          | 3 ---
>  2 files changed, 10 deletions(-)
> 
> diff --git a/qemu-doc.texi b/qemu-doc.texi
> index 56388b5..eac8e8b 100644
> --- a/qemu-doc.texi
> +++ b/qemu-doc.texi
> @@ -2606,13 +2606,6 @@ which is the default.
>  
>  @section System emulator command line arguments
>  
> -@subsection -tdf (since 1.3.0)
> -
> -The ``-tdf'' argument is ignored. The behaviour implemented
> -by this argument is now the default when using the KVM PIT,
> -but can be requested explicitly using
> -``-global kvm-pit.lost_tick_policy=slew''.
> -
>  @subsection -no-kvm-pit-reinjection (since 1.3.0)
>  
>  The ``-no-kvm-pit-reinjection'' argument is now a
> diff --git a/vl.c b/vl.c
> index 81724f5..3956e53 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -3849,9 +3849,6 @@ int main(int argc, char **argv, char **envp)
>                      exit(1);
>                  }
>                  break;
> -            case QEMU_OPTION_tdf:
> -                warn_report("ignoring deprecated option");
> -                break;
>              case QEMU_OPTION_name:
>                  opts = qemu_opts_parse_noisily(qemu_find_opts("name"),
>                                                 optarg, true);
> 

Good one!  Queued, thanks.

Paolo


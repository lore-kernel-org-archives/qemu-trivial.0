Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XjSwT-00049l-MF
	for mharc-qemu-trivial@gnu.org; Wed, 29 Oct 2014 09:05:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XjSwL-0003vo-Ko
	for qemu-trivial@nongnu.org; Wed, 29 Oct 2014 09:05:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XjSwG-0002kj-7L
	for qemu-trivial@nongnu.org; Wed, 29 Oct 2014 09:05:29 -0400
Received: from mail-la0-x22e.google.com ([2a00:1450:4010:c03::22e]:54072)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1XjSwF-0002kd-Ve; Wed, 29 Oct 2014 09:05:24 -0400
Received: by mail-la0-f46.google.com with SMTP id hs14so2474364lab.19
	for <multiple recipients>; Wed, 29 Oct 2014 06:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:newsgroups:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ORqFoZI2c3X2hQx45WSUNexs7805ITTbgTUZDPTyFwY=;
	b=qIh6FzkuXDZq46vA3marg6iFVAAPe6J654I+LwqYb8qLpAq8V3lk2rDwKVRZBbhbyq
	SZtAZR/Bk681KFKURYFiepHq/Qd5oE/tgdOYyQ7QZA5N4yoJdR88K+6XOZpzy2IkRHlp
	hVotnRAoukbOqHh2hej7Kxlw78syov1aiTJuB87pcnOXu098+9/mXuQCi4c9C2Z/5Fd1
	Q27YMTKpLj8UDSKpRgWVzyf1ZEXD9cWQKWbWPrwzWHUzJJp0XK6y0iAlAMNmx38kwHrO
	EhKTrEtEIhALyLgei0oZhIDOjgUPDYq7O7o18jgQAzZYgfJX4FZFh+WLP7z/9eAtD6Dh
	JAQw==
X-Received: by 10.112.141.104 with SMTP id rn8mr11254659lbb.87.1414587922705; 
	Wed, 29 Oct 2014 06:05:22 -0700 (PDT)
Received: from [192.168.10.150] (net-37-117-142-149.cust.vodafonedsl.it.
	[37.117.142.149])
	by mx.google.com with ESMTPSA id le9sm1926765lac.4.2014.10.29.06.05.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Oct 2014 06:05:21 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5450E60C.2020200@redhat.com>
Date: Wed, 29 Oct 2014 14:05:16 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
Newsgroups: gmane.comp.emulators.qemu
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1414586983-10816-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1414586983-10816-1-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::22e
Cc: amit.shah@redhat.com, qemu-trivial@nongnu.org, weidong.huang@huawei.com,
	quintela@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] vl.c: Fix Coverity complaining for
	vmstate_dump_file
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
X-List-Received-Date: Wed, 29 Oct 2014 13:05:35 -0000

On 10/29/2014 01:49 PM, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> commit abfd9ce3(migration: dump vmstate info as a json
> file for static analysis) introduce a new command,
> '-dump-vmstate', that takes a filename
> as an argument.  When executed, QEMU will dump the vmstate information
> for the machine type it's invoked with to the file, and quit.
> 
> Apparently, it supports one '-dump-vmstate' option,
> otherwise, the vmstate_dump_file will be overwritten.
> 
> Of course, the resource will be freed when Qemu quit, but The code logic
> is not good, it will make Coverity complaining.
> 
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  vl.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/vl.c b/vl.c
> index f6b3546..5ef3af9 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -3746,6 +3746,11 @@ int main(int argc, char **argv, char **envp)
>                  configure_msg(opts);
>                  break;
>              case QEMU_OPTION_dump_vmstate:
> +                if (vmstate_dump_file) {
> +                    fprintf(stderr, "qemu: only one '-dump-vmstate' "
> +                            "option may be given\n");
> +                    exit(1);
> +                }
>                  vmstate_dump_file = fopen(optarg, "w");
>                  if (vmstate_dump_file == NULL) {
>                      fprintf(stderr, "open %s: %s\n", optarg, strerror(errno));
> 

Applied, thanks.

Paolo


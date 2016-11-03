Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c2Dap-000643-6B
	for mharc-qemu-trivial@gnu.org; Thu, 03 Nov 2016 04:41:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1c2Dam-00063s-H7
	for qemu-trivial@nongnu.org; Thu, 03 Nov 2016 04:41:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1c2Dai-000097-Jp
	for qemu-trivial@nongnu.org; Thu, 03 Nov 2016 04:41:48 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:32882)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1c2Dai-00008t-D3; Thu, 03 Nov 2016 04:41:44 -0400
Received: by mail-wm0-x241.google.com with SMTP id u144so6809132wmu.0;
	Thu, 03 Nov 2016 01:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=eOZXsa/pvi2Zaf4/MFqQ+SFK9ojZ4UMhNzM0IXXsBrY=;
	b=CAxpPD51ohVAha7srT4Atfo6FNFApZc9ma0kjdFqASscyf8uSOXq3w+coK7u/e8Sfh
	VtkjHKxKKhJlLE9hoRGnZn2eMSdNds+MlTH0wpiyO6czEASWPFolaSo2z57lMphi+Roh
	DoMEuB/LaGY4YfLXSpEDPH8YPOAtSg5sG1z+LwXrH+iPc0M159A+QfTTrPVIvkFhcQ2U
	QFI/PngAdE5j9urArkpVlEjPMLMtWi/hxOrhGk9nn8atg8tuVp0sdk2NxnuB5IRPduak
	8AlmFgAEOwpmUF4dSvvQhlqI4Dn+THlSz47bRglGytyrqxOgSRncXO9RrLi6so2ihKf4
	pTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=eOZXsa/pvi2Zaf4/MFqQ+SFK9ojZ4UMhNzM0IXXsBrY=;
	b=jydfKunZLMm+sKfaWSqTmbsVKuqFZPVVMCP35+pGPbDIR1kp5XaxLMJkU4f7+gAqak
	FtCR8zyi5amxUVKVQnJWTkKWEox1dKgSPpc9uXWojxyVtb0wloFaypRhbqBqdVLCg/+q
	2Lrue2+p+yqJ8pnkOYr6DLWniVRpLULQLxPyShKMdi9tVhVh0aao2V75kns3Yj8cLOH+
	a5hHvhXM+grXL2k0hKaeCJiM7EbVg2+20inC4ZhhHrQZr3ldRidU6Rmxl/VI8yMWME6b
	r19t2MQs4TlbQyy1QOr5CL+wt6cv4MFS+VgtD8QrGitucBZmkrI82JjpYh1gMAtAA4F3
	sX/A==
X-Gm-Message-State: ABUngvc/LQN2US4H7M8s2Q/1GuFfNqjsqmliF1DYE1muWaVeOP0E/Dw3NvjhnKyF7DmqDw==
X-Received: by 10.194.76.166 with SMTP id l6mr6337599wjw.85.1478162503049;
	Thu, 03 Nov 2016 01:41:43 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-78-12-246-178.clienti.tiscali.it.
	[78.12.246.178]) by smtp.googlemail.com with ESMTPSA id
	jx8sm7231159wjc.2.2016.11.03.01.41.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 01:41:42 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <1478096330-18081-1-git-send-email-mjt@msgid.tls.msk.ru>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3253b017-b854-a7ad-af1d-6a7f12e17f18@redhat.com>
Date: Thu, 3 Nov 2016 09:41:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478096330-18081-1-git-send-email-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-trivial] [PATCH v2] vl.c: move pidfile creation up the
 line
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
X-List-Received-Date: Thu, 03 Nov 2016 08:41:49 -0000



On 02/11/2016 15:18, Michael Tokarev wrote:
> With current code, pid file is open after various
> sockets, chardevs, fsdevs and the like.  This causes
> interesting effects, for example when monitor is a
> unix-socket, and another qemu instance is already
> running, new qemu first "damages" the socket and
> next complain that it can't acquire the pid file and
> exits, making running qemu unreachable.
> 
> Move pid file creation earlier, right after the call
> to os_daemonize(), where we know our process id (pid).
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  vl.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> v2: move the pid file creation even earlier, as per
> comment by Markus Armbruster
> 
> diff --git a/vl.c b/vl.c
> index 368510f..ce7e998 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4058,6 +4058,11 @@ int main(int argc, char **argv, char **envp)
>  
>      os_daemonize();
>  
> +    if (pid_file && qemu_create_pidfile(pid_file) != 0) {
> +        error_report("could not acquire pid file: %s", strerror(errno));
> +        exit(1);
> +    }
> +
>      if (qemu_init_main_loop(&main_loop_err)) {
>          error_report_err(main_loop_err);
>          exit(1);
> @@ -4335,11 +4340,6 @@ int main(int argc, char **argv, char **envp)
>      }
>  #endif
>  
> -    if (pid_file && qemu_create_pidfile(pid_file) != 0) {
> -        error_report("could not acquire pid file: %s", strerror(errno));
> -        exit(1);
> -    }
> -
>      if (qemu_opts_foreach(qemu_find_opts("device"),
>                            device_help_func, NULL, NULL)) {
>          exit(0);
> 

Queued, thanks.

Paolo


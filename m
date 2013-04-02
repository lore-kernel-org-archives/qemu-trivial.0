Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UN3su-0004Xn-BO
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2013 12:16:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UN3sm-0004Cj-Ux
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2013 12:16:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UN3sl-0006QH-Ug
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2013 12:16:24 -0400
Received: from mail-la0-x236.google.com ([2a00:1450:4010:c03::236]:43053)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UN3sl-0006Q1-Ne
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2013 12:16:23 -0400
Received: by mail-la0-f54.google.com with SMTP id gw10so567834lab.27
	for <qemu-trivial@nongnu.org>; Tue, 02 Apr 2013 09:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=Oi307WrlLd+GdIMCmbUbihyA97yB622Cv8mJrjZMzVU=;
	b=i7/QWHuui6CuAAQOv4+WS1bpSaCaOdReVcG/Wr1AZAdfQ3RCpwO8MvrCyMnBUELKxV
	uKbo/LxaNDFwjXE27qIxH1qrwZbXU/ShaKTOKH+/Dje5RjS3ES0swshTydnYVNW8boTF
	HBLHyh14c5LDNp636MxHvblRFeMjYlNWf/QVo6wIH9zSBDrHfU5Htq3Epiz1Qr2fAf4K
	D6mCiLsAIvScOa3gMsL8XKVTbncDSPMsZAyA8HlqXb5Gwpb0KpXrC2OHWoVyBvQb3gbm
	lawE9imVJAV85/YreIOu4QH55sEnFy0k5hcEPoFlbH6XtKg4fQloiABotvimk6zox2nH
	AGhw==
X-Received: by 10.112.143.133 with SMTP id se5mr850917lbb.101.1364919382488;
	Tue, 02 Apr 2013 09:16:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.163.68 with HTTP; Tue, 2 Apr 2013 09:16:02 -0700 (PDT)
In-Reply-To: <1364918276-11866-1-git-send-email-pbonzini@redhat.com>
References: <1364918276-11866-1-git-send-email-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Apr 2013 17:16:02 +0100
Message-ID: <CAFEAcA_FTNxeiQe=1ip8T=+C=SO+ygb7NED999_2gCh25dF7og@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkDjqAwWdqXURUctZz0c9sNn7I4bSD6pc5NukRjJDGsUe4p+kfjI+rtffBBDQowKiSj54vL
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::236
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: remove unset
	variables
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
X-List-Received-Date: Tue, 02 Apr 2013 16:16:31 -0000

On 2 April 2013 16:57, Paolo Bonzini <pbonzini@redhat.com> wrote:
> These variables have not been set for a long time.  Do not
> include them in config-host.mak.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM


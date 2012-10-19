Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TPAE3-0006R1-32
	for mharc-qemu-trivial@gnu.org; Fri, 19 Oct 2012 06:54:47 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TPADv-0006Kb-IJ
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 06:54:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TPADu-0000eK-MG
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 06:54:39 -0400
Received: from mail-ie0-f173.google.com ([209.85.223.173]:38370)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TPADu-0000e9-Gr
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 06:54:38 -0400
Received: by mail-ie0-f173.google.com with SMTP id 17so398010iea.4
	for <qemu-trivial@nongnu.org>; Fri, 19 Oct 2012 03:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=g+x/1DlIlXeAb2OgBeh1CABmzrGB9ROLwKwUvbtGpt4=;
	b=dp6C/SFATaNxZ3/+sWDmtB6hl2CgIFUpIbTIbb25wUrXPaLCniOWdj5M2aXmslzvXO
	CU6Z36jUmPmct7WpVZEU8QhiiMmuIKdI+B3tiJN3G3BVtkm3FnykLdexe3+4nAjJ48wG
	A9QOdSw1E0lGlWhvXNg4kA+st23snUwvDHY1raULCbv32pPHQtGSiIN9Sptk73A9447s
	gufl8COBu49tXRwhz861Lvmd39mJptdJVid2eyZcRlbBxJ/D8sIRrFd9ppH0rUwdG5g8
	3GB+RdqzO3pSKFdSwU04rpE2HIcB3T1FbVSKcBQuyGPXEKmiL8O0yTlTrO6Uv0naqNLe
	/7jg==
MIME-Version: 1.0
Received: by 10.50.161.169 with SMTP id xt9mr7667125igb.62.1350644077500; Fri,
	19 Oct 2012 03:54:37 -0700 (PDT)
Received: by 10.50.87.105 with HTTP; Fri, 19 Oct 2012 03:54:37 -0700 (PDT)
In-Reply-To: <1350637684-32300-1-git-send-email-peter.crosthwaite@xilinx.com>
References: <1350637684-32300-1-git-send-email-peter.crosthwaite@xilinx.com>
Date: Fri, 19 Oct 2012 11:54:37 +0100
Message-ID: <CAFEAcA-poGUEscWY89iSO4wg4oRQ0TQVvuyC+4KZN5w-Q_z28A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQk4gX5vU63VcigSttzL89zJwcvyKKGqWMX1oc8Yk87AVTt0YdIn1zjIvOT3AlSwc4rHn8va
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] cadence_uart: More debug
	information
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
X-List-Received-Date: Fri, 19 Oct 2012 10:54:45 -0000

On 19 October 2012 10:08, Peter Crosthwaite
<peter.crosthwaite@xilinx.com> wrote:
> Add more helpful debug information to the cadence UART.
>
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM


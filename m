Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tfx6m-0006n9-N9
	for mharc-qemu-trivial@gnu.org; Tue, 04 Dec 2012 13:20:40 -0500
Received: from eggs.gnu.org ([208.118.235.92]:43010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Tfx6g-0006mv-Fq
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 13:20:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Tfx6a-0004Qg-M6
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 13:20:34 -0500
Received: from mail-pb0-f45.google.com ([209.85.160.45]:47363)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Tfx6a-0004QU-GE
	for qemu-trivial@nongnu.org; Tue, 04 Dec 2012 13:20:28 -0500
Received: by mail-pb0-f45.google.com with SMTP id mc8so2813169pbc.4
	for <qemu-trivial@nongnu.org>; Tue, 04 Dec 2012 10:20:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=IJ11dvwmSoWZTU5VM7Fg1fP3kf0P9wfS0pvIn43H8Ls=;
	b=aFr4xS224UIa7sq2P1lhKFdfvjXdpCK0Uu9Cvrd/JgYdC90hudkP8LkO8Ry3cq4yUT
	E4CMymexVrSKi9Miv9DJfc93F7JMyQ9h8ku9ioKF2cA0A4HSzY4hHh/lJ8E6VJ3Bpsvp
	37Do4As+Oea00oN0DFdDaDFL9YPtMYIW+vIRpaDGSpt9NANhMtXv/TfEsKlxtWEARkEx
	RPf8L6amFT2TJ/IARjo6n1JvJxPbG3ejVKLd9ZIBxp7Xn4KU3fosRqZjWPkC3jdYACXF
	Olwg+tIwTmvRSP5C+XP7Aq20FCbfsFo+zVueFCX4YKSjiB8tFznID3JXf5GE97RRNzrG
	WtFg==
MIME-Version: 1.0
Received: by 10.66.84.131 with SMTP id z3mr37036740pay.34.1354645227789; Tue,
	04 Dec 2012 10:20:27 -0800 (PST)
Received: by 10.66.16.137 with HTTP; Tue, 4 Dec 2012 10:20:27 -0800 (PST)
In-Reply-To: <10b87716a125ba44a314d7a185a48d001fd3d338.1354600680.git.peter.crosthwaite@xilinx.com>
References: <cover.1354600680.git.peter.crosthwaite@xilinx.com>
	<10b87716a125ba44a314d7a185a48d001fd3d338.1354600680.git.peter.crosthwaite@xilinx.com>
Date: Tue, 4 Dec 2012 18:20:27 +0000
Message-ID: <CAFEAcA9SBLcU2avm8ma9h0DtP6=i9j0U1QdhgrJ6Bc0M_vVdCg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQllBS2UH9cMcQcERFpP0FyllHLNlFhP3/zn3JCjwDjT5d/mYhPix6W19dSY4Jqml8D2VABn
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v1 4/4] arm_gic: Add cpu nr to Raised IRQ
	message
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
X-List-Received-Date: Tue, 04 Dec 2012 18:20:40 -0000

On 4 December 2012 06:04, Peter Crosthwaite
<peter.crosthwaite@xilinx.com> wrote:
> Add the relevant CPU nr to this debug message to make IRQ debugging more
> informative.
>
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM


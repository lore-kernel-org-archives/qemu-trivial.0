Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U4v1e-00042x-E0
	for mharc-qemu-trivial@gnu.org; Mon, 11 Feb 2013 10:10:34 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1U4v1b-00041u-Mp
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 10:10:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1U4v1Y-0005Nw-4Q
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 10:10:31 -0500
Received: from mail-lb0-f182.google.com ([209.85.217.182]:51384)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1U4v1X-0005NZ-RO
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 10:10:27 -0500
Received: by mail-lb0-f182.google.com with SMTP id gg6so4592358lbb.41
	for <qemu-trivial@nongnu.org>; Mon, 11 Feb 2013 07:10:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=ErpIoiPecAUn3sWyvENYDJPUwonODGm9N/3IJLHL6Nw=;
	b=NQnz4bfek4PacREoYr7hQsVd+1May7cniH80I1Du/0ErM27oUydzM5icsQuOGNBxkH
	NdEKHMUTl9epHRpeYFUj5Rx3UW69++f3tt1vYWfqxT96RBEDToVNgz6gwUuem4CVh/N1
	cYx/YtuaOgGA9W+kAxZB6cKyNwrr3VAsBgiCgoQdaQje+40m1JZnUR4t5fHQGX1qxq+/
	tcKL4PmvLh1K0H3Oc5QI+4t5EHv8lFjb8FYdtPvqt+XX+EOpndqthaFUAb/A7UrS4UIA
	Gg2IzBDm3qxiHsFFyPJqf/wEyDcTFDAEwemH1ubZpfcYhJnb/HPYM0lG+YYsQQtjiFaq
	mv3Q==
X-Received: by 10.152.110.228 with SMTP id id4mr13330331lab.34.1360595426675; 
	Mon, 11 Feb 2013 07:10:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.69.234 with HTTP; Mon, 11 Feb 2013 07:10:06 -0800 (PST)
In-Reply-To: <1360534332-6549-1-git-send-email-hpoussin@reactos.org>
References: <1360534332-6549-1-git-send-email-hpoussin@reactos.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Feb 2013 15:10:06 +0000
Message-ID: <CAFEAcA9Xf8_HOu1biVhtckp2vAf1VR9-sVtHkPQG2-6uvZxvBA@mail.gmail.com>
To: =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQnaIjWWNFIkSk2PLGfz8RRfGucV/QIc8LRyTiXIOJm7S+s3jaHhi0kagnt2GlbmAqB+Gg2M
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.182
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ide: log error when trying
 to use ATAPI overlapping features
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
X-List-Received-Date: Mon, 11 Feb 2013 15:10:33 -0000

On 10 February 2013 22:12, Herv=C3=A9 Poussineau <hpoussin@reactos.org> wro=
te:
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -1394,8 +1394,10 @@ void ide_exec_cmd(IDEBus *bus, uint32_t val)
>          break;
>      case WIN_PACKETCMD:
>          /* overlapping commands not supported */
> -        if (s->feature & 0x02)
> +        if (s->feature & 0x02) {
> +            qemu_log_mask(LOG_UNIMP, "ide: overlapping command not suppo=
rted");

Messages for qemu_log_mask() need to supply the trailing \n.

Otherwise looks good.

-- PMM


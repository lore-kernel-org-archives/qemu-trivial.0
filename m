Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVw5o-00056l-L1
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:36:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw5m-00054t-Ct
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:36:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw5j-0000gb-9e
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:36:54 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34091)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVw5j-0000gO-52; Fri, 14 Jul 2017 04:36:51 -0400
Received: by mail-qt0-x244.google.com with SMTP id m54so9151049qtb.1;
	Fri, 14 Jul 2017 01:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Qedkf1uqb3Ykr4Uh/9BK9myUYPfDDaLwNTCBpenuVrs=;
	b=I3A2CcAtHEa7emlfbMZwYkk0yf2hJTGxxnvbZwhAbXHD6Z5LKqXDI9derF7TS95zcc
	3n1wDSM+MnONxGjrWDj/OdGaqyjdY82ac6Wz1x73wQDZbhdNa0tn/Qlxs47gVVSJRPq2
	1CTGM/1Z/9FzCwTjyj6Ozz0noaCQZDFELBtwtuA9OH2CQDlNCzdhpEqF5sJ7rMBLDBYj
	hb+Rix35asjpEuear84dE47/39nxWZvuYnI7ksqDggCCwORu5BFIIVN3JwLpDfzFLYAQ
	zPE7NFxwWvQFhAT8ooyjxWFjNK3Ifp58Wa3/xd0BFJPodEkjcDwDF9lwzL6Ej9VqoyKV
	Beaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Qedkf1uqb3Ykr4Uh/9BK9myUYPfDDaLwNTCBpenuVrs=;
	b=DKUogsqPxvaxi9rfqeVZ52ouzlrT9qqSIrWMtMTDtzwo1O11TW532xr6Faod0lGhQH
	VsnAyH/J1gObWta0oe2HjncxniyECSx+43+EXeTzhxv4lEVj84kor43h5kHPiSh7arFF
	djDVMi+UpL3yeV69NwDR/SRf34YZUJMood4MzMfeTiYZI2zC0hIbKZOpRrTfYSahZpRz
	DUm/nfnsVqDESE61g5rOgY/T000IIQUxQ9dTeuDMVgLfaVtHy130ABt3jO5bJ7LhdWOu
	XcblfhEA9W5Hr9H9wZqJFiLL6cEr+BHuv261YBzqYbnenW4vcwhXBb1R9On5H633BY0p
	Ij5g==
X-Gm-Message-State: AIVw113VMKHsOtvWAmQA0lc4CuvajX4FM1CP2IKWFBWq/VElPAgxGJxM
	IiMBDyC8YRx2jii4GrE=
X-Received: by 10.237.38.195 with SMTP id q61mr10785720qtd.245.1500021410611; 
	Fri, 14 Jul 2017 01:36:50 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	p24sm5740612qki.49.2017.07.14.01.36.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:36:50 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	Gerd Hoffmann <kraxel@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-13-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <1fb3155a-46c8-04e8-6a14-7ceed05f53e2@twiddle.net>
Date: Thu, 13 Jul 2017 22:36:46 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-13-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 12/29] ui: use
 DIV_ROUND_UP
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
X-List-Received-Date: Fri, 14 Jul 2017 08:36:55 -0000

On 07/13/2017 06:32 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   ui/cursor.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~


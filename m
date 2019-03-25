Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8N0K-0006Gy-UN
	for mharc-qemu-trivial@gnu.org; Mon, 25 Mar 2019 06:38:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54415)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1h8N0I-0006GS-CI
	for qemu-trivial@nongnu.org; Mon, 25 Mar 2019 06:38:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1h8N0E-0001mg-Ny
	for qemu-trivial@nongnu.org; Mon, 25 Mar 2019 06:38:52 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:53346)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1h8N0C-0001lk-LP
	for qemu-trivial@nongnu.org; Mon, 25 Mar 2019 06:38:50 -0400
Received: by mail-wm1-x32e.google.com with SMTP id q16so8304341wmj.3
	for <qemu-trivial@nongnu.org>; Mon, 25 Mar 2019 03:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=I3FUxpL45+pOwSxirRNFGO+UBRpoJJDo9rpWGrQj/L8=;
	b=bSm93XgOLaV+OJNgj+714LyojACvdXiBCYesrI8qTl+jRrVerNCsFsEPQIgRreh36d
	IYDEK0kL48loa2CmWijmG5UKeFw4b5/ETfWjf20/9wYDcYdfvGrVHk/fpJxojggqfz7l
	79It1OmJFH2snAEG7NBF0bIIPnhYIOTUoX/s7nz30FaiRfcNHb4No6FSGP5Xy4YkU7x0
	ljLL/5AO0cMRJI9UkF9HvlwpU+sGUDssVuogb4CyTMiEHmrQUZo+ALwyWP41oqt10qF+
	ROmemaOAPuFnbHpgM7QhkbmepRWuBel4HqlGyGJ1Qfkz0APVLuPsUhi6ahHwWjQMyTdK
	0pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=I3FUxpL45+pOwSxirRNFGO+UBRpoJJDo9rpWGrQj/L8=;
	b=Ff2RlB5djqxSi1xBuMtCZXTY3QflrI9/PbknZZbmwj9qOTndfKOo6fxDgsago/gM+/
	LZpGRbFGBRsOTIsWfwSWdiIZ6xHeCAT17zHoet3MvOfZufb5vjC5mOMkSSZQpOQrKXF1
	FdWPD+2KQNYj6UtXBRaiQYCCP/MBroEdmSjtFdL9SyXeZCtVywNyzHhzkFkpjMQfuRyM
	56XVEG8HrQFAXPnLNkQpgZVCxlvtQfSv6pQqylK+UvmB3jWKAJdOoP+3iVwDaOeab8Jw
	8t2z4ljpq55PXaqtpjUzfqMShmxggXcAeaxL8jiUF9aZrbn9qlQeU8kzeZ8J84ejWtg5
	Mv0g==
X-Gm-Message-State: APjAAAXGJkvrGygAKXMOx8aFkwD/F/zRxvQ8j7zshgPqpHILj2XiSJJB
	zKNIakDRku0u/Sro7wFljLHWVQ==
X-Google-Smtp-Source: APXvYqxEeeObpDg3usSqf+jVj9qlSYn4hIOw7zLEtAfrSimENifYzoSWipXLh4FBKBdCPFasR2P3Tw==
X-Received: by 2002:a7b:c3c5:: with SMTP id t5mr10896796wmj.110.1553510326592; 
	Mon, 25 Mar 2019 03:38:46 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	l3sm12223853wrr.25.2019.03.25.03.38.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 25 Mar 2019 03:38:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8715E1FF87;
	Mon, 25 Mar 2019 10:38:45 +0000 (UTC)
References: <20190321212528.6100-1-wainersm@redhat.com>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, fam@euphon.net,
	philmd@redhat.com, mjt@tls.msk.ru, laurent@vivier.eu
In-reply-to: <20190321212528.6100-1-wainersm@redhat.com>
Date: Mon, 25 Mar 2019 10:38:45 +0000
Message-ID: <87pnqf6xxm.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::32e
Subject: Re: [Qemu-trivial] [PATCH] docker: trivial changes to `make docker`
 help
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
X-List-Received-Date: Mon, 25 Mar 2019 10:38:55 -0000


Wainer dos Santos Moschetta <wainersm@redhat.com> writes:

> Apply double quotes and period punctuation uniformly.
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Queued to for-4.0/testing-and-fpu-fixes, thanks.

--
Alex Benn=C3=A9e


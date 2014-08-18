Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJU3y-0003As-IT
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 17:01:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XJU3q-00039r-29
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 17:01:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XJU3j-0004l0-Jk
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 17:01:50 -0400
Received: from mail-la0-f49.google.com ([209.85.215.49]:60195)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XJU3j-0004kq-Cn
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 17:01:43 -0400
Received: by mail-la0-f49.google.com with SMTP id hz20so5168775lab.36
	for <qemu-trivial@nongnu.org>; Mon, 18 Aug 2014 14:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EsK2u3DKLrLkNVoFNHr1BOGkbJo8vCn1pPFV0aluxjI=;
	b=Tm2IEu9SB5CAcTztb6NP2Lx0gWz+A9jwScC3mbOVVmjkb9DlSDkHQEvyZtxHsgYa0Q
	nB4OeoZR5fCoO3fJX3TuuqeBJ0vLeMcVlkXnwZ3NOrM59Kvh+XUMsOS9XgyGeGtfZw+J
	AqsXRyCYvtn/Wo34gUZAJLvxtOTTjzj3L8SC0sn/qjo7jDs5Ebk+pVLPZG9MBc31y5+Z
	hFC9RegJqzrXjOE3JbIbfeOIAVI7i1vQUlPQTEBM5MVy0gYSbqgB0JktlnX/6TqrgccB
	h903WZAWv3oJHKN/Qd3hfiuT+uHS5TVMJ0IGYjy+TS9nPIm4J7ieL2lnu5nAgf9DLX1i
	ESUA==
X-Gm-Message-State: ALoCoQlCDL7sY1fT6DYnxsohr9BGio3ULegwPz3IAzdR32+fGo/sdJ1iA52/wewGBMZxr3jZ+wql
X-Received: by 10.112.43.8 with SMTP id s8mr27347lbl.47.1408395702079; Mon, 18
	Aug 2014 14:01:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Mon, 18 Aug 2014 14:01:22 -0700 (PDT)
In-Reply-To: <20140818193641.GB29446@redhat.com>
References: <1408348473-10104-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<53F1E5A4.9060000@msgid.tls.msk.ru> <20140818134421.GA28795@redhat.com>
	<53F20C82.7050506@msgid.tls.msk.ru> <20140818193641.GB29446@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Aug 2014 22:01:22 +0100
Message-ID: <CAFEAcA_BFhsEp3STyD7HM06WuzLKxLWXj2mtmL-9iGjWZ6HLpg@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.49
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Marcel Apfelbaum <marcel.a@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Li Liu <john.liuli@huawei.com>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	peter.huangpeng@huawei.com, Luonengjun <luonengjun@huawei.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v7] tests/bios-tables-test:
 check the value returned by fopen()
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
X-List-Received-Date: Mon, 18 Aug 2014 21:01:56 -0000

On 18 August 2014 20:36, Michael S. Tsirkin <mst@redhat.com> wrote:
> Does test fail if this path is triggered?

If our test harness doesn't report failure when a test
binary returns with a non-zero exit code then the
harness is broken, because there are other test
binaries that rely on that.

thanks
-- PMM


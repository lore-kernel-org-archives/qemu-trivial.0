Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNkdE-0004k0-GO
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2011 07:18:24 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RNkdB-0004aC-Vk
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 07:18:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RNkd8-0002IZ-13
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 07:18:21 -0500
Received: from mail-qy0-f180.google.com ([209.85.216.180]:62761)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1RNkd2-0002H8-Cx; Tue, 08 Nov 2011 07:18:12 -0500
Received: by qyl38 with SMTP id 38so620835qyl.4
	for <multiple recipients>; Tue, 08 Nov 2011 04:18:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.43.3 with SMTP id u3mr3686677qce.210.1320754691453; Tue,
	08 Nov 2011 04:18:11 -0800 (PST)
Received: by 10.229.187.208 with HTTP; Tue, 8 Nov 2011 04:18:11 -0800 (PST)
In-Reply-To: <20111108104441.GA18080@stefanha-thinkpad.localdomain>
References: <4EB45011.6070609@tribudubois.net>
	<20111108104441.GA18080@stefanha-thinkpad.localdomain>
Date: Tue, 8 Nov 2011 12:18:11 +0000
Message-ID: <CAFEAcA8_puQGycqqBA52TcxdMQnrxwF709qXwT5o=rtq8FZ4SA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.180
Cc: qemu-trivial@nongnu.org, paul@codesourcery.com, qemu-devel@nongnu.org,
	Jean-Christophe DUBOIS <jcd@tribudubois.net>
Subject: Re: [Qemu-trivial] [PATCH] arm: Fix CP15 FSR (C5) domain setting
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
X-List-Received-Date: Tue, 08 Nov 2011 12:18:22 -0000

On 8 November 2011 10:44, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Fri, Nov 04, 2011 at 09:50:25PM +0100, Jean-Christophe DUBOIS wrote:
>> During Xvisor development, it was noted that qemu did not return
>> the correct domain value in the Cp15 [Data] FSR register (C5).
>>
>> This patch is a proposal to fix it.
>>
>> Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>
>> ---
>
> CCed Peter Maydell so this can go through the ARM tree.

This is an old and broken version of a patch which I've already
reviewed the fixed version of -- you can ignore this one.

-- PMM


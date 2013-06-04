Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjyGT-0003pp-PS
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 16:55:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58851)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UjyGP-0003el-9n
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:55:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UjyGO-0007m6-7p
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:55:29 -0400
Received: from mail-la0-x22a.google.com ([2a00:1450:4010:c03::22a]:58843)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UjyGO-0007lc-06
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:55:28 -0400
Received: by mail-la0-f42.google.com with SMTP id eb20so721620lab.29
	for <qemu-trivial@nongnu.org>; Tue, 04 Jun 2013 13:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=OVhlpgjcXKTnFDvAKvcX91RHl2yy6oYderknMQ76Y+Y=;
	b=Gazmz0JwCT08wxOUvLDNAWIegdP3mXPGpx9fymCwzx/3PuAhsNQnG5CSA7j+kdat3D
	YsE3x32xPG5zAYP5RX/N9KOugHTg/0H766Y5q1ByImXWZvQdwjnE3Q8Exo68SjJ2Cfr5
	4c8FfUfGYhqX16nhu0245t4VDXNOVI4HHTSVA9xtW/jACFDooyAkdVlnHeW/A6fFRe3L
	lmTh9wrt2XcagtyolbUFxVB3H8qGrn79fZBLGteViFkTBatjzq1JL1LLOvdNKHyT3Tqs
	1EQoIhvPBYIKYFHE7i0m5stX0RKRy62KHlOwT0LiRBFVledBG0FCRHZM38KgN5WaSG9D
	2lwA==
X-Received: by 10.112.120.170 with SMTP id ld10mr570414lbb.31.1370379326458;
	Tue, 04 Jun 2013 13:55:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.2.39 with HTTP; Tue, 4 Jun 2013 13:55:06 -0700 (PDT)
In-Reply-To: <1370377419-31788-3-git-send-email-alevy@redhat.com>
References: <1370377419-31788-1-git-send-email-alevy@redhat.com>
	<1370377419-31788-3-git-send-email-alevy@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Jun 2013 21:55:06 +0100
Message-ID: <CAFEAcA9T6dgQFOuXCOL=oJY0MZy3ZYrxo5qPwOn12D35miqPcw@mail.gmail.com>
To: Alon Levy <alevy@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnrFTzrDAQ49DXgSkzRa9AF89a1UM32twXX+MzkJ2dVjodUC67AocePLi/nf0JENFvOydTd
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::22a
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/5] libcacard/vscclient:
 fix leakage of socket on error paths
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
X-List-Received-Date: Tue, 04 Jun 2013 20:55:31 -0000

On 4 June 2013 21:23, Alon Levy <alevy@redhat.com> wrote:
> Spotted by Coverity.
>
> Signed-off-by: Alon Levy <alevy@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM


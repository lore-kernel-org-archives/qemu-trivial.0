Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axcAD-0006ic-Bi
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 11:23:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1axcA5-0006Tr-Ae
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 11:23:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1axc9t-0008Cx-AC
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 11:22:51 -0400
Received: from mail-vk0-x243.google.com ([2607:f8b0:400c:c05::243]:35956)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>)
	id 1axc9s-00083M-32; Tue, 03 May 2016 11:22:45 -0400
Received: by mail-vk0-x243.google.com with SMTP id u23so2016846vkb.3;
	Tue, 03 May 2016 08:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fq3qtr3anOVRpCJx7zAywARHlRsSws57KmsuzqHQN1s=;
	b=LhE5sp2tSgS7XCbeBdmdBBfjaFuJftW+lE2LbzsS8v2LfAdhbq8ZeY5B8GKVLNidSq
	jxu+wZMdEUDaT/HRXxgm+V2kQAlSRLyX0X7AfaXo+LffK9sPEdZ0IT54CwUGaG+bIzmW
	7C+3LTXEbHomm/CwoLjKcDqIxXmLmBe6Dt3oncWuDzNw7RcD2akpgZguxneZ6qRO4dqN
	jmTsVxmCFBgHpev7ZECW73tQmvvXuV6xbUYKZpngVmoNsLinGZq3JVvBC3ZPKUVPuHUE
	oFZeUCPw4EKNq6cMriru5AfnCqGsNz3p6N6wcIFN0ZlG2fYVBZHOppnUFRsBys7x7G1h
	PTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fq3qtr3anOVRpCJx7zAywARHlRsSws57KmsuzqHQN1s=;
	b=R2LvfHPSLMsXOXM80r/LA8d/DwP+DswoAmqW+QkZXNm4dOBu0IAC+8xoRigy/Se+0s
	rCBNbSJAqrbKnAeeX+u6stxQDNr6bhdsGE8rwpeFHYvqgPwOYXj3b4DXWJzty/SgCpCK
	VSIGz1tZGFHL80PfjZq2qBMNOkJNbX48Q2cISMnVwAB7eZPFGJY2Z61+0GBQ+3IfYMJv
	YCyT6EPCyoi2Qw/bYPSFXB7Da+rNKb9mJbKCl+q5B5AP04L/UCsnHDDKXICU7bej0qCW
	H6GyZWodP3/BsbSM1vfvEcfDOHLGHPVVPqf4TW9cUDw3oidz3Y9VueRmmK7EOy5z9uKc
	GagA==
X-Gm-Message-State: AOPr4FVyNCRm1hw7JiM5bliP1+lIvtqbWQIZHoEDaO2/zZRFvnVw590sPZZlasNnU1oPzo01KCHjWE0A/a1HRA==
X-Received: by 10.159.39.194 with SMTP id b60mr1308926uab.151.1462288932314;
	Tue, 03 May 2016 08:22:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.184.134 with HTTP; Tue, 3 May 2016 08:21:52 -0700 (PDT)
In-Reply-To: <1462270357.31362.1.camel@redhat.com>
References: <1459862499-4768-1-git-send-email-haris.phnx@gmail.com>
	<CAE_WKMx3p0MFJWOamHFgrqiP2pxqmG2hou+pOaVOQq66pMUtAg@mail.gmail.com>
	<1462270357.31362.1.camel@redhat.com>
From: haris iqbal <haris.phnx@gmail.com>
Date: Tue, 3 May 2016 20:51:52 +0530
Message-ID: <CAE_WKMyAjkUQfN8eUnLJ3VAvrPVVO0F1JJetn5emomyp2PvumA@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] Changed malloc to
 g_malloc, free to g_free in ui/shader.c
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
X-List-Received-Date: Tue, 03 May 2016 15:23:04 -0000

On Tue, May 3, 2016 at 3:42 PM, Gerd Hoffmann <kraxel@redhat.com> wrote:
> On Di, 2016-05-03 at 15:16 +0530, haris iqbal wrote:
>> Just a reminder. waiting for a review for the previous patch.
>
> Patch is fine.  Just stalled b/c we are in code freeze, I expect trivial
> queue will pick this up for the 2.7 devel cycle.
>
> cheers,
>   Gerd
>

Thanks for the fast response. :)


-- 

With regards,

Md Haris Iqbal,
Placement Coordinator, MTech IT
NITK Surathkal,
Contact: +91 8861996962<div id="DDB4FAA8-2DD7-40BB-A1B8-4E2AA1F9FDF2"><br />
<table style="border-top: 1px solid #aaabb6;">
	<tr>
        <td style="width: 55px; padding-top: 13px;"><a
href="https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail"
target="_blank"><img
src="https://ipmcdn.avast.com/images/2016/icons/icon-envelope-tick-round-orange-v1.png"
/></a></td>
		<td style="width: 470px; padding-top: 15px; color: #41424e;
font-size: 13px; font-family: Arial, Helvetica, sans-serif;
line-height: 18px;">Virus-free. <a
href="https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail"
target="_blank" style="color: #4453ea;">www.avast.com</a>
		</td>
	</tr>
</table><a href="#DDB4FAA8-2DD7-40BB-A1B8-4E2AA1F9FDF2" width="1"
height="1"></a></div>


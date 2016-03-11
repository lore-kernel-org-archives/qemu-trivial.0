Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aePP5-0008IU-NK
	for mharc-qemu-trivial@gnu.org; Fri, 11 Mar 2016 10:55:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aePP3-0008ID-00
	for qemu-trivial@nongnu.org; Fri, 11 Mar 2016 10:55:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aePOz-00082N-OQ
	for qemu-trivial@nongnu.org; Fri, 11 Mar 2016 10:55:00 -0500
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:37811)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1aePOz-00081r-HR; Fri, 11 Mar 2016 10:54:57 -0500
Received: by mail-wm0-x22c.google.com with SMTP id p65so23094357wmp.0;
	Fri, 11 Mar 2016 07:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=3zUmavSQ/k1X8R9OoiGLxi4lo6IjXx3mzJ0vvdzz+jw=;
	b=BDFPkNmlXj1/aZ/9Ajt2640AwTAhwO1hHckK6WPrg0c93IdSQq5LExsbqEUu1cKuVd
	lfjHUD98sPDTbYlfAPcwNuaPqMUsIm8z3BQB5zfeiwsRYUj791VY+yT6lMvByRkasN+d
	qtCtb270p6pnyKP8CYfo2oEyopYJmBx2F3Ccu3EEjIPhRmU9E/BDvdm6Lmv2/b8NUOEy
	bc+O4WW2vFDD8R/fp9uwZJ64rF7I1+jNeh+uw16NKXHmgko7xFlhJMq7sjSktKi8T3Bc
	HUo+Z5fdrLv4YpQmMs4DRHaysTZUP3vtXi+QtBgop8ksG5bPTo5earYRtqFt0hay5Y23
	XN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=3zUmavSQ/k1X8R9OoiGLxi4lo6IjXx3mzJ0vvdzz+jw=;
	b=lWS1DMQ2jTFwheycls7lr+UZ7h4yyhkXFqyq+2kg6khYUjtUtGmcMEXstHCVY7pqjU
	RgTIdi2WCSVpYziOuhVkrm+2edXeLaLLE1MnP0I1zLQS83B4hjSUJC82EW7BvVGzKDQI
	9rfoFx6T/t4rq5FqPlAiyTiW1x4JpjJC9McuFWZvHm26lNZ6AClU3s/pW241R6qTZDCz
	zuaPZPoE/Y7ffUC8N9N7zdnutkWhCnawBvXbDQN9qIfxjTwng1ovp2LsKjSbvl18z9GV
	IwHPusWYd0ON0SqaQM4JEEO3IsAATm3DTPLMGstarObICOtCsjVTsuUfmqBbLwdvWBkO
	c5fw==
X-Gm-Message-State: AD7BkJITuRg9B+BeqcV6+7euWIDUvh0NryXp+ROot0rCtPL9/vRn3eL+SXlDxMP1R90VHw==
X-Received: by 10.28.96.197 with SMTP id u188mr3831634wmb.26.1457711696674;
	Fri, 11 Mar 2016 07:54:56 -0800 (PST)
Received: from [192.168.10.165] (94-39-161-17.adsl-ull.clienti.tiscali.it.
	[94.39.161.17]) by smtp.googlemail.com with ESMTPSA id
	hm9sm9037643wjb.34.2016.03.11.07.54.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2016 07:54:55 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Siddharth Gupta <siddharthgupta04@gmail.com>, qemu-devel@nongnu.org
References: <CALwKnOgaM2AKdHX+tJ8vh17rh3Hdd4uqdVBCZ=su-Asi=0eL_A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56E2EA4F.3020803@redhat.com>
Date: Fri, 11 Mar 2016 16:54:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CALwKnOgaM2AKdHX+tJ8vh17rh3Hdd4uqdVBCZ=su-Asi=0eL_A@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22c
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] BitsSizedTasks-LargeFrames
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
X-List-Received-Date: Fri, 11 Mar 2016 15:55:01 -0000

Hi Siddharth,

because you are touching possibly "hot" code paths, it is not possible
to just move the allocation to the heap.  You will have to check whether
the number of used items is low enough and, if not, switch from the
stack-allocated array to the heap.  This way the stack-allocated array
can be made smaller (e.g. 2K).

Thanks,

Paolo

On 11/03/2016 15:50, Siddharth Gupta wrote:
> 


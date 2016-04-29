Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aw9lS-0008Jn-Bp
	for mharc-qemu-trivial@gnu.org; Fri, 29 Apr 2016 10:51:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aw9lI-0007ua-4C
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 10:51:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aw9l6-00021L-6y
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 10:51:14 -0400
Received: from mail-yw0-x235.google.com ([2607:f8b0:4002:c05::235]:34629)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aw9l4-0001ww-W1
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 10:51:08 -0400
Received: by mail-yw0-x235.google.com with SMTP id j74so169226171ywg.1
	for <qemu-trivial@nongnu.org>; Fri, 29 Apr 2016 07:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FH20Q4AoqRYFE8ZieKQu5ncGVDruMWEELJwbvr0B328=;
	b=TYj9mkf0fVzz2buGBqbNGJDpGfvo58gPGufjeL0fP/Nb9gLdtYF+Nld5qD8Xbb2Kla
	LPVFOsTvmvvJ7mUypaBtYYie0wAtbKupIBdO/Ridst8SovtuWovHCgwKi+eHvFpKzWJh
	zpZM0g5iJBzrFoDb0aAF3K4fnvdvhCakAYhZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FH20Q4AoqRYFE8ZieKQu5ncGVDruMWEELJwbvr0B328=;
	b=G+OLhx/Aknha1mGFKtsmpnDaE+Yn0DrvXEgP2sPGzq3tNszOdFKkIwEvZSpZRV7mTU
	u45Pa9KZJ9mpC6SGfAXXpvbnHJEIkpa6OUhohkSSx1d/lKu0jGTOLh4GJyISOXNav8dp
	OuE8rD1/CITukzbVgANJfFpV5fqlwkYK1nk4eFPjUbo404tA3eUkujbsw1E1PMkTerqI
	zepUMlGspYcohtu/rufY7wghK/1nh5hyeAMUIWItjFAvigt8QwrP4+OXZpRIbEwv4qAb
	3EClZVM4m0cVALNitI7FlUG3Lk7Bk1OadIJasR9WjtW4lwqm2hDT6ibGvvyzvHcFHU3w
	9veQ==
X-Gm-Message-State: AOPr4FVrnzGoZkjBKXjPX/wg/UxlPwCd2llp9/vGWuTmSRapXnxFArMYzueoQsNrtBnGenQXzfuJ0zWEr6fYsd9M
X-Received: by 10.176.4.20 with SMTP id 20mr11824032uav.125.1461941444970;
	Fri, 29 Apr 2016 07:50:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Fri, 29 Apr 2016 07:49:56 -0700 (PDT)
In-Reply-To: <9e437a9d-1725-5e2a-a43d-7952ccdf79ed@weilnetz.de>
References: <1461935279-30418-1-git-send-email-jano.vesely@gmail.com>
	<CAFEAcA-yNp8wGnyzMrTu=28g4vYPv-5F-PJ4aeHq8xSnxRZLkA@mail.gmail.com>
	<5723680D.2050601@weilnetz.de>
	<CAFEAcA9dHj60vTBm5TG0Ob072U64Vy8A0cGocPg7LNdO=aNqow@mail.gmail.com>
	<9e437a9d-1725-5e2a-a43d-7952ccdf79ed@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Apr 2016 15:49:56 +0100
Message-ID: <CAFEAcA-gYp9TS=JrEGgnP8uwXGuhcUzq5+wgdTDhigTyDNND9w@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: Jan Vesely <jano.vesely@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::235
Subject: Re: [Qemu-trivial] [PATCH] configure: Check if struct fsxattr is
 available from linux header
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
X-List-Received-Date: Fri, 29 Apr 2016 14:51:28 -0000

On 29 April 2016 at 15:31, Stefan Weil <sw@weilnetz.de> wrote:
> Is it a bug of the system headers? Or simply a design which
> requires users to be careful when including certain header files?
>
> Both /usr/include/xfs/xfs_fs.h and /usr/include/linux/fs.h define
> the same struct fsxattr, and both definitions are identical.

That sounds like a header bug to me...

http://oss.sgi.com/archives/xfs/2016-02/msg00324.html

suggests that (a) the xfsprogs folks are updating their
header to deal with what the kernel header is doing and that
(b) they think the distros ought to be updating both of them
in sync in some way...

> Of course a good comment would be helpful here, e. g.
>
> # Avoid redefinition of struct fsxattr in xfs/xfs_fs.h.
> # It is already defined in linux/fs.h.

Yes, this is really all I want: a note that some versions of
the kernel headers and the xfs headers clash, so we suppress
the xfs version if the kernel header is providing the struct.

thanks
-- PMM


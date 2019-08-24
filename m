Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i1QVk-0000Ny-Jm
	for mharc-qemu-trivial@gnu.org; Sat, 24 Aug 2019 03:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36529)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i1QVi-0000NY-Aj
 for qemu-trivial@nongnu.org; Sat, 24 Aug 2019 03:30:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i1QVh-0007mO-3a
 for qemu-trivial@nongnu.org; Sat, 24 Aug 2019 03:30:54 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33724)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i1QVg-0007jj-RD
 for qemu-trivial@nongnu.org; Sat, 24 Aug 2019 03:30:53 -0400
Received: by mail-wr1-x444.google.com with SMTP id u16so10565118wrr.0
 for <qemu-trivial@nongnu.org>; Sat, 24 Aug 2019 00:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=Q7dE7xRWtNonIg7MYGdizMevWkr3L0SG5YEIrbJTAy0=;
 b=h+g6K5DcdRlYKfmxnQCmjESeeiMRJ3Y+LG4TFVgYCRJPyFBM/h5lW9iRQ4MJqfp0x9
 Hj55wCmOovdJV3MmcEgfyNIMjg3+6jxBxCYM3vyrZjneFfvhgMUkLhe/trQjNES8Xa8q
 4CZcD4ntkl2ic2Jift1RgGMcoQmfv0BbEEkbSImAyGFfbPmeI2v4ZiEH/S1sf6zwhxTP
 zbQA2ibWt8mSVaofWlDpDljWpMO5v6v5wNzQMEuj6DFkIa6/iY7Zh/QqmBvfbd+OZ7fq
 5gJ32b39IVnzCCDhgDtlhodQ6/QM524Y6Gr+fytrGOjUONlIprhlrn1TTXwgK2+tarM3
 t39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=Q7dE7xRWtNonIg7MYGdizMevWkr3L0SG5YEIrbJTAy0=;
 b=DRVPx9MEZS99XzrjXwPUCSFoDEtk8R2Fz8+mrMy38l7Ept0Hglbxy2JTEsegsYx1Iv
 zFS8hWj0E2yAwlK6e/0U7WbtacUVRzjTq+Ivzm0cHW0qoC4cNUM3IEJ0xUQMkhmha7EN
 35C4Vb9HkfMU2VosDKuAwwLDZOXXRjg7BEBIKINPYDMcX36FS5p6DAxxJSGLbSEdMNj7
 kEE2/SgpIBg87fDrnY0PX84Fy9Cj+GiSJhk4zm4JTVdGRAWzV6/8HWfEqdPM7IDr+KGQ
 HgWQP3+8/rETGW/g3LnhkIEN9d44tiNTFqkIx5lVjztoXEA6yHQl75ktZL2P1l7NrYih
 DNFw==
X-Gm-Message-State: APjAAAXY8ZkQzXO5ROHPNUbqz+ZyowC+ojrtjJfbi+v0J1LwpeRZmy8n
 /Tn72rJwKm6rHGgUzK4jDJfYTg==
X-Google-Smtp-Source: APXvYqyy+PyOpBNQD+RuJzprbao603f/OoeLpaV4QmD4xAW+NZtuI0J76jnabUn8moUUIoiEgfC58g==
X-Received: by 2002:adf:f646:: with SMTP id x6mr10151004wrp.18.1566631851256; 
 Sat, 24 Aug 2019 00:30:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b15sm4399956wrt.77.2019.08.24.00.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Aug 2019 00:30:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CAEA01FF87;
 Sat, 24 Aug 2019 08:30:49 +0100 (BST)
References: <20190822230916.576-1-philmd@redhat.com>
 <874l2876kx.fsf@dusky.pond.sub.org>
 <CAL1e-=hvVp4i=s_Wr0iKy5UO7kH6xw3QR0Ms4_v_tobJSM2wRA@mail.gmail.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, qemu-devel@nongnu.org
In-reply-to: <CAL1e-=hvVp4i=s_Wr0iKy5UO7kH6xw3QR0Ms4_v_tobJSM2wRA@mail.gmail.com>
Date: Sat, 24 Aug 2019 08:30:49 +0100
Message-ID: <87a7bz2f6e.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/3] mailmap: Clean up
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 24 Aug 2019 07:30:55 -0000


Aleksandar Markovic <aleksandar.m.mail@gmail.com> writes:

> 23.08.2019. 08.13, "Markus Armbruster" <armbru@redhat.com> =D1=98=D0=B5 =
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>>
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>
>> > Trivial cleanup of .mailmap to have a nice 'git shortlog' output.
>> >
>> > Philippe Mathieu-Daud=C3=A9 (3):
>> >   mailmap: Reorder by sections
>> >   mailmap: Update philmd email address
>> >   mailmap: Add many entries to improve 'git shortlog' statistics
>> >
>> >  .mailmap | 123 +++++++++++++++++++++++++++++++++++++++++++++++++++----
>> >  1 file changed, 115 insertions(+), 8 deletions(-)
>>
>> Series
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>
>> However, it increases the difference to contrib/gitdm/aliases.
>
> Alex' initial gitdm effort, as I understood it, was not meant to cover all
> history from 2007 or so, but just to give reasonable statistics for 2018
> (amd future years).
>
> In that light, .mailmap and gitdm aliases do not need to be equivalent.
>
> But perhaps Alex would now want gitdm to be used for all QEMU history? Is
> this desirable?

It would be of interest historically but not something I'd want to spend
a lot of time adding code churn for.

>
> Aleksandar
>
>> I'm just
>> as guilty; my recent "[PATCH 2/2] contrib/gitdm: Add armbru@pond.sub.org
>> to group-map-redhat" updates only that. and not .mailmap.
>>
>> Perhaps we want to keep the two in sync manually.  We should then add
>> suitable comments to each file.
>>
>> Could we instead teach gitdm to use .mailmap, and ditch
>> contrib/gitdm/aliases?
>>
>> aliases' format is documented in gitdm's README.  Each line maps a
>> non-canonical e-mail address to a canonical one.
>>
>> .mailmap's format is documented in git-shortlog(1).  It can do a bit
>> more.  Even the common part differs: it has two addresses in different
>> order *boggle*.
>>


--
Alex Benn=C3=A9e


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1koWfL-0005qm-JT
	for mharc-qemu-trivial@gnu.org; Sun, 13 Dec 2020 14:04:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koWfK-0005qZ-DQ
 for qemu-trivial@nongnu.org; Sun, 13 Dec 2020 14:04:18 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:45733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koWfI-0006sW-Se
 for qemu-trivial@nongnu.org; Sun, 13 Dec 2020 14:04:18 -0500
Received: by mail-ej1-x641.google.com with SMTP id qw4so19510463ejb.12
 for <qemu-trivial@nongnu.org>; Sun, 13 Dec 2020 11:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j0NYrno7+/a+lc7xZFPAcM7hD6rNZwF5bjkMU0YChUI=;
 b=xzGVv2/UfyemM4rvmBrUB4SlBpCmKvZaZ3QJYbis9Z2eIOaGAL6lDZ/7E4/C0A0XVn
 2cVXCnaCTy0mWXA5apjOgy1TsyFXq6NLJ4NPhOuz0/J2i4lli37AnXjgHJpuxRAOlolC
 Fj3JJhpQkoZfV2VRZ/AVZqeMoGSUuaqifPgg8YuT/ARoyinqTgseQF15eq4+38M7U8wC
 +Tng4/GRgjuL5arjpMe1K55lIAq8BOpEFPrd/eZwy/J56OspFjN7cY1LkNTU+Ay7YhXY
 BK1AKNqGzkF5jzEs/XX5HETLjHX5amsBJkbu48q7OHWsiEHmJMVLPL2yoDAnyqwTIaip
 kGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j0NYrno7+/a+lc7xZFPAcM7hD6rNZwF5bjkMU0YChUI=;
 b=sggExXmWuVRYTMYVn5e4TbCgVA5Vkxs7grnq7irwaw3jo4MkmzRbTgDbvT3SNpmHs+
 RSkbqNoyN8dtxhmcccLVaVbw6Cyd5aRDR3PE4RCZgQ7q2bxT/1rOv7iDbf9aMSX5x+zw
 X/a1TaWtErB3O0tkevRtMFRLZdZyaAwRSiIliZLJkccTglo4zXwpG4vhuEjS2nXSFdfG
 jhBJtgy6h/jgsqaO5lpOeNQ7CtKeTpq6TKBn7hGn0lGLzjgGVNicqhRW8cB0dn4VMsvB
 GS+ylglC+9D95igzIuhUlg320Ioti9Mhk8Xq13xY1d5oojEuc2eqxmi0djHe4xB17ikd
 apWg==
X-Gm-Message-State: AOAM532Npw1IwxcN4ljCYUeyTabWCd+k/y1dvW2S8Nhewuidru3aXlbU
 C7RRO/NZCWD3iFCTfAae0yAqYsC+AdP0q404ife6Rg==
X-Google-Smtp-Source: ABdhPJzCn2l075u5AR+/mFubKk+5wXEnbzlQnPd7iPuKY5fl27FyQkWwkq0UQSiyA2mQZWOmhufYtR2q6MyTfsc9I/c=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr19909712ejb.56.1607886255504; 
 Sun, 13 Dec 2020 11:04:15 -0800 (PST)
MIME-Version: 1.0
References: <20200825202755.50626-1-r.bolshakov@yadro.com>
 <20200825202755.50626-3-r.bolshakov@yadro.com>
 <1ff85cc3-40dc-98da-fb18-a1b3d134d7dc@redhat.com>
 <bc560d06-2b8d-3ef0-b9e6-ddaeb58daa13@vivier.eu>
In-Reply-To: <bc560d06-2b8d-3ef0-b9e6-ddaeb58daa13@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 13 Dec 2020 19:04:04 +0000
Message-ID: <CAFEAcA_XA1FcQos+m0vv6DVkbaybYwX5ytsM5gMaLAtL0jGGgA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] Makefile: Require GNU make 3.82+
To: Laurent Vivier <laurent@vivier.eu>
Cc: Thomas Huth <thuth@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Sun, 13 Dec 2020 19:04:18 -0000

On Sun, 13 Dec 2020 at 17:22, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 12/10/2020 =C3=A0 11:47, Thomas Huth a =C3=A9crit :
> > On 25/08/2020 22.27, Roman Bolshakov wrote:
> >> QEMU build fails with cryptic messages if make is too old:
> >>
> >>   Makefile.ninja:2655: *** multiple target patterns.  Stop.
> >>
> >> To avoid the confusion it's worth to fail the build right away and pri=
nt
> >> a friendly error message.
> >>
> >> +ifeq ($(filter undefine,$(value .FEATURES)),)
> >> +$(error Unsupported Make version: $(MAKE_VERSION). \
> >> +        Please use GNU Make 3.82 or above)
> >> +endif
> >> +
> >>  # Always point to the root of the build tree (needs GNU make).
> >>  BUILD_DIR=3D$(CURDIR)
> >
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> >
> >
>
> Applied to my trivial-patches branch.

Commit 09e93326e448ab4 says that the switch to ninja from
ninjatool removed the requirement for Make 3.82. Is this
change still required?

thanks
-- PMM


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1u0RlV-0003ia-RN
	for mharc-qemu-trivial@gnu.org; Thu, 03 Apr 2025 17:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1u0RlU-0003hX-Ik
 for qemu-trivial@nongnu.org; Thu, 03 Apr 2025 17:06:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1u0RlQ-0001Wf-Qs
 for qemu-trivial@nongnu.org; Thu, 03 Apr 2025 17:06:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743714375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LAS7lMS0j9uWbLWAb8/6QQXBvU4fh+KKVhZ6nD97MPE=;
 b=F/XFAOIjSo3aIahLbSbuzELlU/u49PurprRpUeo8vGnnX9mzd3ou+hTgQPrCEHYW20Z/x0
 JAAkAt2qqHAQY1vnLXNL0wU6m0mRiVZCA20fZegxtglRxR6JJ6dBIf05G3bcomNJOkVcle
 AB30dwG0tI/oeUzQ9fq5nn+s1T1PkXU=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-JcCzHfrePLyOha6KCM6sPA-1; Thu, 03 Apr 2025 17:06:13 -0400
X-MC-Unique: JcCzHfrePLyOha6KCM6sPA-1
X-Mimecast-MFC-AGG-ID: JcCzHfrePLyOha6KCM6sPA_1743714372
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-af9070a5311so852347a12.0
 for <qemu-trivial@nongnu.org>; Thu, 03 Apr 2025 14:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743714371; x=1744319171;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LAS7lMS0j9uWbLWAb8/6QQXBvU4fh+KKVhZ6nD97MPE=;
 b=iwBvsL3PRVBKKNlcqNz5qkAMC7OQO8XSu7DtFZMrLqqk/6vd9rnGyqUlqX5Jbq92tK
 ylEDmE/rv0C5XjGS+eljrnZ/JnZdvuZZ2apgm5ZFghpZ9L0d3EF8biOcOx7OTyUGSpnH
 8ekDm1I7WZ+Nyn3+FvVzZV6tqe+gSdLaJXovlZ7XP24xQy/PS0c7avd9I65OdioFZF9T
 mSqnxFODCYCHbGgRgmZeyiYJAHbJFQLTGKHCJ79KQMriU1ZiR0eTCe6xd7qf20HQHaWk
 p594OmyixcgPJsR6KiZ0Ediy4G2MSJYVemUr9fJwaOSV+gw0W/Zq62KJuVSP4p47Lv3q
 VkDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/OwppwNL4AxUaX36yaS9PowNO6r/WCG/nX4JSstlVNbXwf2UgsPidqdX1UOPc5/l/qksX6naj1RJS4z8=@nongnu.org
X-Gm-Message-State: AOJu0YxDVCYJs/e6/msLNsje4+C/6rk6lz+bjK4//FHUmx60ZCFoPTl7
 gWac0JIVVLiUw7Zm+HBsRb3lvuY3qY7PHBbfqvucQO6j/Jcf9o1Rv1PjEscXJWTJlYRl1O0TE5z
 FJIBc5ZdJK5STKMfCVRvcU+TuLU4b3ZLu4QzrtJeef81oT7OHueyDF2s9MyV5V0grP5iTtKs1ub
 r3coqOwoYU8u7XD8NijTU2KEA/cUQd5mGJ9/1Wvg==
X-Gm-Gg: ASbGnctzACIwXGW7TP+JUfm+pICNjSNOWKjc2dt3ZT6I0oqsJDKK+E1YkCs5MjWYnXX
 p74gJjeegnGDnykADLuhEhgQP4Ub3oU6RF+tKx+86zB/wiIhFy488OY/SHIHyj67vyXX4lHPCJj
 Ywst5f7EDNq/Gogkzm9976ad/Fhs24
X-Received: by 2002:a17:90a:e18f:b0:2f6:d266:f467 with SMTP id
 98e67ed59e1d1-306a4920677mr1191755a91.34.1743714370827; 
 Thu, 03 Apr 2025 14:06:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn2wzMSOY974kDYpcng2++6L1QqPygucq8xEkSw2u4rywy6wtkID20WgqUEr+aMaEoOEghBsEuEOs8L3+4HDs=
X-Received: by 2002:a17:90a:e18f:b0:2f6:d266:f467 with SMTP id
 98e67ed59e1d1-306a4920677mr1191729a91.34.1743714370539; Thu, 03 Apr 2025
 14:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250326195756.330817-1-jsnow@redhat.com>
 <20250326195756.330817-3-jsnow@redhat.com>
 <87zfh6yh1o.fsf@pond.sub.org>
 <CAFn=p-bwhzosvS8v7q1sKhYaa39LkPKAoYkog14jEg_S_s0jHg@mail.gmail.com>
 <877c445s9i.fsf@pond.sub.org>
In-Reply-To: <877c445s9i.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 3 Apr 2025 17:05:58 -0400
X-Gm-Features: AQ5f1JorJzWvhZjL335Qj_mg2Kzfz1OVv1rkGsDm0UwV2LuK70blbVR9GXxaNfU
Message-ID: <CAFn=p-a7yd2B4XvHWDMVd64MYEY1hU485LmD=tUwmKxxGU7eLQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] docs, qapi: generate undocumented return sections
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Fabiano Rosas <farosas@suse.de>, 
 Paolo Bonzini <pbonzini@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Hanna Reitz <hreitz@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Yanan Wang <wangyanan55@huawei.com>, qemu-block@nongnu.org, 
 Lukas Straub <lukasstraub2@web.de>, Jiri Pirko <jiri@resnulli.us>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Zhenwei Pi <pizhenwei@bytedance.com>, 
 Eric Blake <eblake@redhat.com>, Peter Xu <peterx@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fVOZfCfToNlOQfZ2IyuCOMYhZZdv9CRwK9ozNkw3DGA_1743714372
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a5642c0631e6232b"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.649,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Apr 2025 21:06:20 -0000

--000000000000a5642c0631e6232b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 2:07=E2=80=AFAM Markus Armbruster <armbru@redhat.com=
> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > On Thu, Mar 27, 2025 at 5:11=E2=80=AFAM Markus Armbruster <armbru@redha=
t.com>
> wrote:
> >
> >> John Snow <jsnow@redhat.com> writes:
> >>
> >> > This patch changes the qapidoc transmogrifier to generate Return val=
ue
> >> > documentation for any command that has a return value but hasn't
> >> > explicitly documented that return value.
> >> >
> >> > Signed-off-by: John Snow <jsnow@redhat.com>
> >>
> >> Might want to briefly explain placement of the auto-generated return
> >> value documentation.  But before we discuss that any further, let's
> >> review the actual changes the the generated docs.
> >>
> >> This patch adds auto-generated return value documentation where we hav=
e
> >> none.
> >>
> >> The next patch replaces handwritten by auto-generated return value
> >> documentation where these are at least as good.  Moves the return valu=
e
> >> docs in some cases.
> >>
> >> First the additions:
> >>
> >> * x-debug-query-block-graph
> >>
> >>   Title, intro, features, return
> >>
> >> * query-tpm
> >>
> >>   Title, intro, return, example
> >>
> >> * query-dirty-rate
> >>
> >>   Title, intro, arguments, return, examples
> >>
> >> * query-vcpu-dirty-limit
> >>
> >>   Title, intro, return, example
> >>
> >> * query-vm-generation-id
> >>
> >>   Title, return
> >>
> >> * query-memory-size-summary
> >>
> >>   Title, intro, example, return
> >>
> >> * query-memory-devices
> >>
> >>   Title, intro, return, example
> >>
> >> * query-acpi-ospm-status
> >>
> >>   Title, intro, return, example
> >>
> >> * query-stats-schemas
> >>
> >>   Title, intro, arguments, note, return
> >>
> >> Undesirable:
> >>
> >> * query-memory-size-summary has returns after the example instead of
> >>   before.  I figure it needs the TODO hack to separate intro and examp=
le
> >>   (see announce-self).
> >>
> >
> > Yes
> >
> >
> >>
> >> * query-stats-schemas has a note between arguments and return.  I thin=
k
> >>   this demonstrates that the placement algorithm is too simplistic.
> >>
> >
> > Yeah ... It's just that *glances at length of email* it's been a
> sensitive
> > topic without a lot of certainty in desire, so I've tried to keep thing=
s
> on
> > the stupid/simple side ...
>
> When the best solution is unclear, starting discussion with a simplistic
> solution is smart.  Beats starting with a complicated solution that gets
> shot down.
>
> >> Debatable:
> >>
> >> * x-debug-query-block-graph has returns after features.  I'd prefer
> >>   returns before features.  No need to debate this now.
> >>
> >
> > Willing to do this for you if you'd like to enforce it globally. I'd be
> > happy with any mandated order of sections, really.
>
> Could a more rigid order help the inliner, too?
>

Oh, absolutely. My series that adds it still assumes a rigid ordering. It
just never enforced it. I don't really care what the order even is, just as
long as there is one.


>
> >> Next the movements:
> >>
> >> * x-debug-block-dirty-bitmap-sha256
> >>
> >>   From right before errors to right after
> >>
> >> * blockdev-snapshot-delete-internal-sync
> >>
> >>   From right before errors to right after
> >>
> >> * query-xen-replication-status
> >>
> >>   From between intro and example to the end
> >>
> >> * query-colo-status
> >>
> >>   From between intro and example to the end
> >>
> >> * query-balloon
> >>
> >>   From right before errors to right after
> >>
> >> * query-hv-balloon-status-report
> >>
> >>   From right before errors to right after
> >>
> >> * query-yank
> >>
> >>   From between intro and example to the end
> >>
> >> * add-fd
> >>
> >>   From between arguments and errors to between last note and example
> >>
> >> I don't like any of these :)
> >>
> >
> > So it goes ...
> >
> >
> >>
> >> Undesirable:
> >>
> >> * query-xen-replication-status, query-yank, and query-colo-status now
> >>   have return after the example instead of before.  I figure they now
> >>   need the TODO hack to separate intro and example.
> >>
> >
> > Yes
> >
> >
> >>
> >> * add-fd now has a note between arguments and return.  Same placement
> >>   weakness as for query-stats above.
> >>
> >> Debatable:
> >>
> >> * x-debug-block-dirty-bitmap-sha256,
> >>   blockdev-snapshot-delete-internal-sync, query-colo-status, and
> >>   query-hv-balloon-status-report now have return after errors instead =
of
> >>   before.  I'd prefer before.
> >>
> >> What's the stupidest acceptable placement algorithm?  Maybe this one:
> >>
> >> 1. If we have arguments, return goes right after them.
> >>
> >> 2. Else if we have errors, return goes right before them.
> >>
> >> 3. Else if we have features, return goes right before them.
> >>
> >> 4. Else return goes right after the intro (to make this work, we need
> >>    a few more TODO hacks).
> >>
> >> Would you be willing to give this a try?
> >>
> >
> > Probably ...
> >
> > So this algorithm seems to imply a preference for this ordering:
> >
> > 1. Intro
> > 2. Arguments
> > 3. Return
> > 4. Errors
> > 5. Features
> > 6. Details
> >
> > Do I have that correct?
>
> Yes, with
>
>   7. Since
>

Sure. I tend to exclude it because I personally remove it from the flow
anyway, so I don't actually care where it is. If you do, that's fine!


>
> although a case could also be made for
>

but you'd prefer the first one, right? I have no interest in making further
cases at the moment ;)


>
>   1. Intro
>   2. Arguments
>   3. Return
>   4. Errors
>   5. Features
>   6. Since
>   7. Details
>
>

--000000000000a5642c0631e6232b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 1, =
2025 at 2:07=E2=80=AFAM Markus Armbruster &lt;<a href=3D"mailto:armbru@redh=
at.com">armbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" =
target=3D"_blank">jsnow@redhat.com</a>&gt; writes:<br>
<br>
&gt; On Thu, Mar 27, 2025 at 5:11=E2=80=AFAM Markus Armbruster &lt;<a href=
=3D"mailto:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; w=
rote:<br>
&gt;<br>
&gt;&gt; John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank=
">jsnow@redhat.com</a>&gt; writes:<br>
&gt;&gt;<br>
&gt;&gt; &gt; This patch changes the qapidoc transmogrifier to generate Ret=
urn value<br>
&gt;&gt; &gt; documentation for any command that has a return value but has=
n&#39;t<br>
&gt;&gt; &gt; explicitly documented that return value.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.c=
om" target=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Might want to briefly explain placement of the auto-generated retu=
rn<br>
&gt;&gt; value documentation.=C2=A0 But before we discuss that any further,=
 let&#39;s<br>
&gt;&gt; review the actual changes the the generated docs.<br>
&gt;&gt;<br>
&gt;&gt; This patch adds auto-generated return value documentation where we=
 have<br>
&gt;&gt; none.<br>
&gt;&gt;<br>
&gt;&gt; The next patch replaces handwritten by auto-generated return value=
<br>
&gt;&gt; documentation where these are at least as good.=C2=A0 Moves the re=
turn value<br>
&gt;&gt; docs in some cases.<br>
&gt;&gt;<br>
&gt;&gt; First the additions:<br>
&gt;&gt;<br>
&gt;&gt; * x-debug-query-block-graph<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0Title, intro, features, return<br>
&gt;&gt;<br>
&gt;&gt; * query-tpm<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0Title, intro, return, example<br>
&gt;&gt;<br>
&gt;&gt; * query-dirty-rate<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0Title, intro, arguments, return, examples<br>
&gt;&gt;<br>
&gt;&gt; * query-vcpu-dirty-limit<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0Title, intro, return, example<br>
&gt;&gt;<br>
&gt;&gt; * query-vm-generation-id<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0Title, return<br>
&gt;&gt;<br>
&gt;&gt; * query-memory-size-summary<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0Title, intro, example, return<br>
&gt;&gt;<br>
&gt;&gt; * query-memory-devices<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0Title, intro, return, example<br>
&gt;&gt;<br>
&gt;&gt; * query-acpi-ospm-status<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0Title, intro, return, example<br>
&gt;&gt;<br>
&gt;&gt; * query-stats-schemas<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0Title, intro, arguments, note, return<br>
&gt;&gt;<br>
&gt;&gt; Undesirable:<br>
&gt;&gt;<br>
&gt;&gt; * query-memory-size-summary has returns after the example instead =
of<br>
&gt;&gt;=C2=A0 =C2=A0before.=C2=A0 I figure it needs the TODO hack to separ=
ate intro and example<br>
&gt;&gt;=C2=A0 =C2=A0(see announce-self).<br>
&gt;&gt;<br>
&gt;<br>
&gt; Yes<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; * query-stats-schemas has a note between arguments and return.=C2=
=A0 I think<br>
&gt;&gt;=C2=A0 =C2=A0this demonstrates that the placement algorithm is too =
simplistic.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Yeah ... It&#39;s just that *glances at length of email* it&#39;s been=
 a sensitive<br>
&gt; topic without a lot of certainty in desire, so I&#39;ve tried to keep =
things on<br>
&gt; the stupid/simple side ...<br>
<br>
When the best solution is unclear, starting discussion with a simplistic<br=
>
solution is smart.=C2=A0 Beats starting with a complicated solution that ge=
ts<br>
shot down.<br>
<br>
&gt;&gt; Debatable:<br>
&gt;&gt;<br>
&gt;&gt; * x-debug-query-block-graph has returns after features.=C2=A0 I&#3=
9;d prefer<br>
&gt;&gt;=C2=A0 =C2=A0returns before features.=C2=A0 No need to debate this =
now.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Willing to do this for you if you&#39;d like to enforce it globally. I=
&#39;d be<br>
&gt; happy with any mandated order of sections, really.<br>
<br>
Could a more rigid order help the inliner, too?<br></blockquote><div><br></=
div><div>Oh, absolutely. My series that adds it still assumes a rigid order=
ing. It just never enforced it. I don&#39;t really care what the order even=
 is, just as long as there is one.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt;&gt; Next the movements:<br>
&gt;&gt;<br>
&gt;&gt; * x-debug-block-dirty-bitmap-sha256<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0From right before errors to right after<br>
&gt;&gt;<br>
&gt;&gt; * blockdev-snapshot-delete-internal-sync<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0From right before errors to right after<br>
&gt;&gt;<br>
&gt;&gt; * query-xen-replication-status<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0From between intro and example to the end<br>
&gt;&gt;<br>
&gt;&gt; * query-colo-status<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0From between intro and example to the end<br>
&gt;&gt;<br>
&gt;&gt; * query-balloon<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0From right before errors to right after<br>
&gt;&gt;<br>
&gt;&gt; * query-hv-balloon-status-report<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0From right before errors to right after<br>
&gt;&gt;<br>
&gt;&gt; * query-yank<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0From between intro and example to the end<br>
&gt;&gt;<br>
&gt;&gt; * add-fd<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0From between arguments and errors to between last note=
 and example<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t like any of these :)<br>
&gt;&gt;<br>
&gt;<br>
&gt; So it goes ...<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Undesirable:<br>
&gt;&gt;<br>
&gt;&gt; * query-xen-replication-status, query-yank, and query-colo-status =
now<br>
&gt;&gt;=C2=A0 =C2=A0have return after the example instead of before.=C2=A0=
 I figure they now<br>
&gt;&gt;=C2=A0 =C2=A0need the TODO hack to separate intro and example.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Yes<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; * add-fd now has a note between arguments and return.=C2=A0 Same p=
lacement<br>
&gt;&gt;=C2=A0 =C2=A0weakness as for query-stats above.<br>
&gt;&gt;<br>
&gt;&gt; Debatable:<br>
&gt;&gt;<br>
&gt;&gt; * x-debug-block-dirty-bitmap-sha256,<br>
&gt;&gt;=C2=A0 =C2=A0blockdev-snapshot-delete-internal-sync, query-colo-sta=
tus, and<br>
&gt;&gt;=C2=A0 =C2=A0query-hv-balloon-status-report now have return after e=
rrors instead of<br>
&gt;&gt;=C2=A0 =C2=A0before.=C2=A0 I&#39;d prefer before.<br>
&gt;&gt;<br>
&gt;&gt; What&#39;s the stupidest acceptable placement algorithm?=C2=A0 May=
be this one:<br>
&gt;&gt;<br>
&gt;&gt; 1. If we have arguments, return goes right after them.<br>
&gt;&gt;<br>
&gt;&gt; 2. Else if we have errors, return goes right before them.<br>
&gt;&gt;<br>
&gt;&gt; 3. Else if we have features, return goes right before them.<br>
&gt;&gt;<br>
&gt;&gt; 4. Else return goes right after the intro (to make this work, we n=
eed<br>
&gt;&gt;=C2=A0 =C2=A0 a few more TODO hacks).<br>
&gt;&gt;<br>
&gt;&gt; Would you be willing to give this a try?<br>
&gt;&gt;<br>
&gt;<br>
&gt; Probably ...<br>
&gt;<br>
&gt; So this algorithm seems to imply a preference for this ordering:<br>
&gt;<br>
&gt; 1. Intro<br>
&gt; 2. Arguments<br>
&gt; 3. Return<br>
&gt; 4. Errors<br>
&gt; 5. Features<br>
&gt; 6. Details<br>
&gt;<br>
&gt; Do I have that correct?<br>
<br>
Yes, with<br>
<br>
=C2=A0 7. Since<br></blockquote><div><br></div><div>Sure. I tend to exclude=
 it because I personally remove it from the flow anyway, so I don&#39;t act=
ually care where it is. If you do, that&#39;s fine!</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
although a case could also be made for<br></blockquote><div><br></div><div>=
but you&#39;d prefer the first one, right? I have no interest in making fur=
ther cases at the moment ;)</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
=C2=A0 1. Intro<br>
=C2=A0 2. Arguments<br>
=C2=A0 3. Return<br>
=C2=A0 4. Errors<br>
=C2=A0 5. Features<br>
=C2=A0 6. Since<br>
=C2=A0 7. Details<br>
<br>
</blockquote></div></div>

--000000000000a5642c0631e6232b--



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQRbf-0003Ft-AZ
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2020 04:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kQRbd-0003Do-0v
 for qemu-trivial@nongnu.org; Thu, 08 Oct 2020 04:48:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kQRbb-0000D4-Jx
 for qemu-trivial@nongnu.org; Thu, 08 Oct 2020 04:48:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602146931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gn8ciapQFrAaoRvaIAaEVTIRELXck+2gCFokoTvnVsQ=;
 b=SN+E4+YF6opzFK8JEwLmzb2EgBpbNrE/lnc8A+YHiojbratj+syV2+u2akUX8OVtMvP2ly
 77wZ7/nXpqKQjy/iWMVUg6tPXr2OJgK+nCQY3rY0HaWNb9leSaZ6S9D28n6hP9pPl11bOF
 rdCCZTj1r3uisP1t/26wPkfTOcBcrjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-iMRrkPxrP_umKdXKqXdRBg-1; Thu, 08 Oct 2020 04:48:47 -0400
X-MC-Unique: iMRrkPxrP_umKdXKqXdRBg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93BE781E235;
 Thu,  8 Oct 2020 08:48:46 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-40.ams2.redhat.com [10.36.113.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2317350B44;
 Thu,  8 Oct 2020 08:48:44 +0000 (UTC)
Subject: Re: [PATCH] Fixing LGPL version number
To: Chetan <chetan4windows@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20201008060528.68579-1-chetan4windows@gmail.com>
 <df199cc8-c383-ed03-6244-7a204e92397b@redhat.com>
 <ba4f81dd-8e5c-1d50-311c-fdc41f9cc504@redhat.com>
 <CAPPKfOHQV44b+kkcc3QYsLXya-5Ttcbve51uqRUS0e5GyouX6w@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <fbb818b9-a17b-a69d-d0fc-957749d17193@redhat.com>
Date: Thu, 8 Oct 2020 10:48:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAPPKfOHQV44b+kkcc3QYsLXya-5Ttcbve51uqRUS0e5GyouX6w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 01:56:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 08 Oct 2020 08:48:57 -0000

On 08/10/2020 10.40, Chetan wrote:
> Hello,
> 
> I'll be working on replacing the license text in LGPL licensed files with
> the SPDX identifier tag and will submit it as a separate patch.

I'm also not sure whether it's legally possible to replace the license text
without agreement of all authors of the file ... so better don't do a global
patch for that right now, start with one subsystem instead and see whether
it gets accepted... or maybe we should only add the SPDX tags, without
removing the license text? ... this all might require some more discussions
first ...

 Thomas



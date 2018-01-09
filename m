Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eYyLr-0002pF-A0
	for mharc-qemu-trivial@gnu.org; Tue, 09 Jan 2018 13:10:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYyLo-0002lj-Gw
	for qemu-trivial@nongnu.org; Tue, 09 Jan 2018 13:10:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYyLn-0007UD-Am
	for qemu-trivial@nongnu.org; Tue, 09 Jan 2018 13:10:16 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:40673)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eYyLk-0007RZ-Ao; Tue, 09 Jan 2018 13:10:12 -0500
Received: by mail-wm0-x243.google.com with SMTP id f206so22329880wmf.5;
	Tue, 09 Jan 2018 10:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Y2LHrcCDq5TuSRWFl8sFjD2rjZV6GvJUowLDOyJ7uZs=;
	b=rAWx7Gd3hUuIfG/uy9oCRNGcSlKD3E4eL6oKg35h9a5atbUywuxQU5XEXZW+qzLq1a
	ouKADCUlxBtiV0yN+r/wloLCRbimSrm4bsA5v4649sMahy1IaVu180uhCufSlPm1LrWV
	laZE4TSs//AsZQl+cVba2k8tCVlEDa4qXIEBnawkxT6znj+EunrzFZQxkqSCFjggtvtY
	uLDEpCVVEcjZgfCbAL0kP6zj7FEQakuPB9GyZclRhjCJbTgLEuPIELaMNRZgylJsRU2W
	k3B86FXy2iPIZq9JFhkZYtF2+56SLXnfhbW8cZxsvxKYokcDruHRcZ14wDHm1RE0Ih/e
	ZYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Y2LHrcCDq5TuSRWFl8sFjD2rjZV6GvJUowLDOyJ7uZs=;
	b=GJa25nR6BMsJ9+Ca2DQc+DpcrRH0tseSUXzZWGXoC7cr2EQWq2KmNP57F7ra0MZ8m6
	nW/Jgl08gxE1NYumc2MSba95iQJQemPH5Aml4qNYUz9ia18/fNhSolymQ2mgLEfqIW6U
	gzgPYAYardMNj3OZaSWes6VD29BjuB6N2fPxgyEXQEIU1jgHegZ15zcamPUaDQ3bid9d
	B5ASzgnKBU6F7TfEVC+Jpby5M9QkqTQsXpx8UQ8oAq8yCxSbsjt56CvhtngBHrypS/4Z
	5yPZ3iZ+ndtOJVkhGo57U5C97Jt8uonWpCbwy29n7OvMTw2QNEcyABrI3Lf2tGfLU8jc
	Jzhw==
X-Gm-Message-State: AKGB3mLHYJxXcPEa1s2QuoRzDeS6uGPyWg11TN/9MQD3LwVv3Q3bU9RP
	n13GUogrVeRSsFwF0n29Y3LPdmQarYqtSLYchlE=
X-Google-Smtp-Source: ACJfBouWCY37VLtV/o0B7SavwwFvvSil2lbomkPbcBR0f7Y1XV+BdMjQGSdX+n8j0znBnVPtzubx5gaR24Q1n269IUo=
X-Received: by 10.28.55.74 with SMTP id e71mr13434868wma.50.1515521411198;
	Tue, 09 Jan 2018 10:10:11 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.164.69 with HTTP; Tue, 9 Jan 2018 10:09:40 -0800 (PST)
In-Reply-To: <20180109184523.3d0aab51.cohuck@redhat.com>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
	<3f49c0ff601f27534d4536c87c00d01c233e067f.1513790495.git.alistair.francis@xilinx.com>
	<20180109184523.3d0aab51.cohuck@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 9 Jan 2018 10:09:40 -0800
X-Google-Sender-Auth: IN14lmWeXiENk5mLI1Lmi4ea5gI
Message-ID: <CAKmqyKN9HVzOfRK57keymYHe1k31sQE1WMTEUGVgawkOxug2RQ@mail.gmail.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v6 21/29] hw/s390x: Replace
 fprintf(stderr, "*\n" with error_report()
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
X-List-Received-Date: Tue, 09 Jan 2018 18:10:17 -0000

On Tue, Jan 9, 2018 at 9:45 AM, Cornelia Huck <cohuck@redhat.com> wrote:
> On Wed, 20 Dec 2017 09:24:41 -0800
> Alistair Francis <alistair.francis@xilinx.com> wrote:
>
>> Replace a large number of the fprintf(stderr, "*\n" calls with
>> error_report(). The functions were renamed with these commands and then
>> compiler issues where manually fixed.
>>
>> find ./* -type f -exec sed -i \
>>     'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>>     {} +
>> find ./* -type f -exec sed -i \
>>     'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>>     {} +
>> find ./* -type f -exec sed -i \
>>     'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>>     {} +
>> find ./* -type f -exec sed -i \
>>     'N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>>     {} +
>> find ./* -type f -exec sed -i \
>>     'N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>>     {} +
>> find ./* -type f -exec sed -i \
>>     'N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>>     {} +
>> find ./* -type f -exec sed -i \
>>     'N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>>     {} +
>> find ./* -type f -exec sed -i \
>>     'N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>>     {} +
>> find ./* -type f -exec sed -i \
>>     'N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>>     {} +
>> find ./* -type f -exec sed -i \
>>     'N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>>     {} +
>> find ./* -type f -exec sed -i \
>>     'N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
>>     {} +
>>
>> Some lines where then manually tweaked to pass checkpatch.
>>
>> One fprintf(stderr, was manually converted to a
>> qemu_log_mask(LOG_GUEST_ERROR,
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> ---
>> V3:
>>  - Use a qemu_log_mask(LOG_GUEST_ERROR,
>> V2:
>>  - Split hw patch into individual directories
>>
>>  hw/s390x/virtio-ccw.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
>> index 38f6a8afc9..3d8f26949b 100644
>> --- a/hw/s390x/virtio-ccw.c
>> +++ b/hw/s390x/virtio-ccw.c
>> @@ -426,8 +426,9 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
>>                   * passes us zeroes for those we don't support.
>>                   */
>>                  if (features.features) {
>> -                    fprintf(stderr, "Guest bug: features[%i]=%x (expected 0)\n",
>> -                            features.index, features.features);
>> +                    qemu_log_mask(LOG_GUEST_ERROR,
>> +                                  "Guest bug: features[%i]=%x (expected 0)",
>> +                                  features.index, features.features);
>>                      /* XXX: do a unit check here? */
>>                  }
>>              }
>
> I'll queue this to s390-next so this doesn't get lost.
>
> I'll also tweak the commit message, as nothing is converted to
> error_report().

Thanks!

Alistair


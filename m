Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dDGXR-00045I-Bw
	for mharc-qemu-trivial@gnu.org; Tue, 23 May 2017 16:36:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1dDGXP-00044o-BT
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 16:36:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1dDGXL-0000NC-BY
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 16:36:15 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58144
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mdroth@linux.vnet.ibm.com>)
	id 1dDGXL-0000Md-72
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 16:36:11 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v4NKOshe020249
	for <qemu-trivial@nongnu.org>; Tue, 23 May 2017 16:36:09 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2amuhv9ph9-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Tue, 23 May 2017 16:36:09 -0400
Received: from localhost
	by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mdroth@linux.vnet.ibm.com>;
	Tue, 23 May 2017 16:36:08 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
	by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 23 May 2017 16:36:05 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
	[9.57.199.108])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	v4NKZv1l54001754; Tue, 23 May 2017 20:36:05 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A8481B4485;
	Tue, 23 May 2017 16:33:42 -0400 (EDT)
Received: from localhost (unknown [9.53.92.194])
	by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 9676FB4489;
	Tue, 23 May 2017 16:33:42 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <48dfeca5-0640-796f-66ce-8cab198fcaef@redhat.com>
Cc: famz@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-trivial@nongnu.org, armbru@redhat.com,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
References: <149546869825.1005.10210133978512879518@c05f1edc8ed1>
	<48dfeca5-0640-796f-66ce-8cab198fcaef@redhat.com>
User-Agent: alot/0.5.1
Date: Tue, 23 May 2017 15:35:59 -0500
X-TM-AS-GCONF: 00
x-cbid: 17052320-0008-0000-0000-000002273E70
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007107; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000212; SDB=6.00864632; UDB=6.00429241;
	IPR=6.00644413; 
	BA=6.00005369; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015555;
	XFM=3.00000015; UTC=2017-05-23 20:36:07
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17052320-0009-0000-0000-000035626076
Message-Id: <149557175992.17498.17080031766560479760@loki>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-05-23_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
	definitions=main-1705230104
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] tests/libqtest: Print
 error instead of aborting when env variable is missing
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
X-List-Received-Date: Tue, 23 May 2017 20:36:16 -0000

Quoting Thomas Huth (2017-05-23 02:25:30)
> On 22.05.2017 17:58, no-reply@patchew.org wrote:
> > This series failed automatic build test. Please find the testing comman=
ds and
> > their output below. If you have docker installed, you can probably repr=
oduce it
> > locally.
> [...]
> >        LEX convert-dtsv0-lexer.lex.c
> >        DEP /tmp/qemu-test/src/dtc/fdtdump.c
> > make[1]: flex: Command not found
> >        BISON dtc-parser.tab.c
> > make[1]: bison: Command not found
> >        DEP /tmp/qemu-test/src/dtc/srcpos.c
> >        LEX dtc-lexer.lex.c
> > make[1]: flex: Command not found
> >        DEP /tmp/qemu-test/src/dtc/treesource.c
> >        DEP /tmp/qemu-test/src/dtc/livetree.c
> >        DEP /tmp/qemu-test/src/dtc/fstree.c
> >        DEP /tmp/qemu-test/src/dtc/flattree.c
> >        DEP /tmp/qemu-test/src/dtc/dtc.c
> >        DEP /tmp/qemu-test/src/dtc/data.c
> >        DEP /tmp/qemu-test/src/dtc/checks.c
> >       CHK version_gen.h
> >        BISON dtc-parser.tab.c
> > make[1]: bison: Command not found
> >        LEX convert-dtsv0-lexer.lex.c
> >       UPD version_gen.h
> > make[1]: flex: Command not found
> >        LEX dtc-lexer.lex.c
> > make[1]: flex: Command not found
> >        DEP /tmp/qemu-test/src/dtc/util.c
> >        LEX convert-dtsv0-lexer.lex.c
> >        BISON dtc-parser.tab.c
> > make[1]: flex: Command not found
> > make[1]: bison: Command not found
> >        LEX dtc-lexer.lex.c
> > make[1]: flex: Command not found
> =

> Looks like flex and bison are missing in the docker image? Could someone
> please add it?
> =

> [...]
> >   CC      replay/replay-internal.o
> > /tmp/qemu-test/src/replay/replay-internal.c: In function =E2=80=98repla=
y_put_array=E2=80=99:
> > /tmp/qemu-test/src/replay/replay-internal.c:65: warning: ignoring retur=
n value of =E2=80=98fwrite=E2=80=99, declared with attribute warn_unused_re=
sult
> =

> I guess that should be fixed?
> =

> [...]
> >   CC      slirp/tcp_input.o
> >   CC      slirp/tcp_output.o
> >   CC      slirp/tcp_subr.o
> >   CC      slirp/tcp_timer.o
> > /tmp/qemu-test/src/slirp/tcp_input.c: In function =E2=80=98tcp_input=E2=
=80=99:
> > /tmp/qemu-test/src/slirp/tcp_input.c:219: warning: =E2=80=98save_ip.ip_=
p=E2=80=99 may be used uninitialized in this function
> > /tmp/qemu-test/src/slirp/tcp_input.c:219: warning: =E2=80=98save_ip.ip_=
len=E2=80=99 may be used uninitialized in this function
> > /tmp/qemu-test/src/slirp/tcp_input.c:219: warning: =E2=80=98save_ip.ip_=
tos=E2=80=99 may be used uninitialized in this function
> > /tmp/qemu-test/src/slirp/tcp_input.c:219: warning: =E2=80=98save_ip.ip_=
id=E2=80=99 may be used uninitialized in this function
> > /tmp/qemu-test/src/slirp/tcp_input.c:219: warning: =E2=80=98save_ip.ip_=
off=E2=80=99 may be used uninitialized in this function
> > /tmp/qemu-test/src/slirp/tcp_input.c:219: warning: =E2=80=98save_ip.ip_=
ttl=E2=80=99 may be used uninitialized in this function
> > /tmp/qemu-test/src/slirp/tcp_input.c:219: warning: =E2=80=98save_ip.ip_=
sum=E2=80=99 may be used uninitialized in this function
> > /tmp/qemu-test/src/slirp/tcp_input.c:219: warning: =E2=80=98save_ip.ip_=
src.s_addr=E2=80=99 may be used uninitialized in this function
> > /tmp/qemu-test/src/slirp/tcp_input.c:219: warning: =E2=80=98save_ip.ip_=
dst.s_addr=E2=80=99 may be used uninitialized in this function
> > /tmp/qemu-test/src/slirp/tcp_input.c:220: warning: =E2=80=98save_ip6.ip=
_nh=E2=80=99 may be used uninitialized in this function
> =

> I've never seen these warnings in tcp_input.c before ... and they also
> look like false positives too me ... is that GCC in the docker image too
> sensitive?
> =

> [...]
> >   CC      aarch64-softmmu/hw/timer/exynos4210_rtc.o
> > /tmp/qemu-test/src/hw/i386/pc_piix.c: In function =E2=80=98igd_passthro=
ugh_isa_bridge_create=E2=80=99:
> > /tmp/qemu-test/src/hw/i386/pc_piix.c:1067: warning: =E2=80=98pch_rev_id=
=E2=80=99 may be used uninitialized in this function
> =

> dito
> =

> >   CC      aarch64-softmmu/hw/usb/tusb6010.o
> > /tmp/qemu-test/src/hw/i386/acpi-build.c: In function =E2=80=98build_app=
end_pci_bus_devices=E2=80=99:
> > /tmp/qemu-test/src/hw/i386/acpi-build.c:525: warning: =E2=80=98notify_m=
ethod=E2=80=99 may be used uninitialized in this function
> =

> dito
> =

> [...]
> > /tmp/qemu-test/src/tests/ide-test.c: In function =E2=80=98cdrom_pio_imp=
l=E2=80=99:
> > /tmp/qemu-test/src/tests/ide-test.c:803: warning: ignoring return value=
 of =E2=80=98fwrite=E2=80=99, declared with attribute warn_unused_result
> > /tmp/qemu-test/src/tests/ide-test.c: In function =E2=80=98test_cdrom_dm=
a=E2=80=99:
> > /tmp/qemu-test/src/tests/ide-test.c:899: warning: ignoring return value=
 of =E2=80=98fwrite=E2=80=99, declared with attribute warn_unused_result
> =

> Needs a patch, I guess?
> =

> >   GTESTER tests/test-vmstate
> > Failed to load simple/primitive:b_1
> > Failed to load simple/primitive:i64_2
> > Failed to load simple/primitive:i32_1
> > Failed to load simple/primitive:i32_1
> > Failed to load test/with_tmp:a
> > Failed to load test/tmp_child_parent:f
> > Failed to load test/tmp_child:parent
> > Failed to load test/with_tmp:tmp
> > Failed to load test/tmp_child:diff
> > Failed to load test/with_tmp:tmp
> > Failed to load test/tmp_child:diff
> > Failed to load test/with_tmp:tmp
> =

> That works for me when I run "make check" locally ... could my patch
> have broken this, or is there something else wrong in the repository or
> docker image?
> =

> [...]
> >   GTESTER tests/test-qga
> >   GTESTER tests/test-timed-average
> >   GTESTER tests/test-io-task
> >   GTESTER tests/test-io-channel-socket
> >   GTESTER tests/test-io-channel-file
> >   GTESTER tests/test-io-channel-command
> >   GTESTER tests/test-io-channel-buffer
> >   GTESTER tests/test-base64
> >   GTESTER tests/test-crypto-ivgen
> >   GTESTER tests/test-crypto-afsplit
> >   GTESTER tests/test-crypto-xts
> >   GTESTER tests/test-crypto-block
> >   GTESTER tests/test-logging
> >   GTESTER tests/test-replication
> >   GTESTER tests/test-bufferiszero
> >   GTESTER tests/test-uuid
> >   GTESTER tests/ptimer-test
> >   GTESTER tests/test-qapi-util
> >   GTESTER check-qtest-x86_64
> >   GTESTER check-qtest-aarch64
> >   GTESTER tests/test-qobject-output-visitor
> >   GTESTER tests/test-clone-visitor
> >   GTESTER tests/test-qobject-input-visitor
> >   GTESTER tests/test-qmp-commands
> >   GTESTER tests/test-string-input-visitor
> >   GTESTER tests/test-string-output-visitor
> >   GTESTER tests/test-qmp-event
> >   GTESTER tests/test-opts-visitor
> >   GTESTER tests/test-qht-par
> > qemu-system-aarch64: warning: CPU(s) not present in any NUMA nodes: CPU=
 2 [thread-id: 2], CPU 3 [thread-id: 3], CPU 6 [thread-id: 6], CPU 7 [threa=
d-id: 7]
> > qemu-system-aarch64: warning: All CPU(s) up to maxcpus should be descri=
bed in NUMA config, ability to start up with partial NUMA mappings is obsol=
eted and will be removed in future
> > **
> > ERROR:/tmp/qemu-test/src/tests/test-qga.c:894:test_qga_guest_exec: asse=
rtion failed: (exited)
> > GTester: last random seed: R02S88fe048bce3aa693228ab12699fc6771
> > make: *** [check-tests/test-qga] Error 1
> > make: *** Waiting for unfinished jobs....
> =

> I also can not reproduce this here when running "make check". I also can
> not see how this should be related to my patch ... could it be that the
> docker image was simply running into some time out problems here 'cause
> the server was overloaded? In that case we should maybe increase the
> timeout value in test_qga_guest_exec() ?

I wouldn't be opposed to that, but > 5s to echo a string seems like a
pretty extreme case of load.

> =

>  Thomas
> =

> =

>=20


